// Powered by deepseek

local pos = 0;
local len = 0;
local error = false;
local str = "";

function sourceToTable(string) {
    len = string.len();
    str = string;
    local result = parseValue();
    if (error) return null;
    skipWhitespace();
    if (pos < len) {
        error = true;
        AILog.Error("sourceToTable: Trailing characters after value at position " + pos);
        return null;
    }
    return result;
}

// 跳过空白字符
function skipWhitespace() {
    while (pos < len && (str[pos] == ' ' || str[pos] == '\t' || str[pos] == '\r' || str[pos] == '\n')) {
        pos++;
    }
}

// 期望当前字符为 ch，否则记录错误并返回 false
function expectChar(ch) {
    if (error) return false;
    if (pos >= len || str[pos] != ch) {
        error = true;
        AILog.Error("sourceToTable: Expected '" + ch + "' at position " + pos);
        return false;
    }
    pos++;
    return true;
}

// 解析字符串（支持转义 \" 和 \\）
function parseString() {
    if (error) return null;
    if (!expectChar('"')) return null;   // 消耗起始引号
    local result = "";
    while (pos < len && !error) {
        local ch = str[pos];
        if (ch == '"') {
            pos++;  // 消耗结束引号
            return result;
        } else if (ch == '\\') {
            pos++; // 跳过反斜杠
            if (pos >= len) {
                error = true;
                AILog.Error("sourceToTable: Unterminated escape sequence");
                return null;
            }
            local esc = str[pos];
            if (esc == '\\') {
                result += '\\';
            } else if (esc == '"') {
                result += '"';
            } else {
                error = true;
                AILog.Error("sourceToTable: Unknown escape sequence '\\" + esc + "'");
                return null;
            }
            pos++;
        } else {
            result += ch;
            pos++;
        }
    }
    if (!error) {
        error = true;
        AILog.Error("sourceToTable: Unterminated string literal");
    }
    return null;
}

// 解析数字
function parseNumber() {
    if (error) return null;
    local start = pos;
    // 允许负号
    if (pos < len && str[pos] == '-') pos++;
    // 整数部分
    if (pos >= len || !(str[pos] >= '0' && str[pos] <= '9')) {
        error = true;
        AILog.Error("sourceToTable: Invalid number at position " + pos);
        return null;
    }
    while (pos < len && (str[pos] >= '0' && str[pos] <= '9')) pos++;
    // 小数部分
    if (pos < len && str[pos] == '.') {
        pos++;
        while (pos < len && (str[pos] >= '0' && str[pos] <= '9')) pos++;
    }
    // 指数部分
    if (pos < len && (str[pos] == 'e' || str[pos] == 'E')) {
        pos++;
        if (pos < len && (str[pos] == '+' || str[pos] == '-')) pos++;
        if (pos >= len || !(str[pos] >= '0' && str[pos] <= '9')) {
            error = true;
            AILog.Error("sourceToTable: Invalid exponent");
            return null;
        }
        while (pos < len && (str[pos] >= '0' && str[pos] <= '9')) pos++;
    }
    local numStr = str.slice(start, pos);
    // 判断是否为浮点数
    if (numStr.find('.') != null || numStr.find('e') != null || numStr.find('E') != null) {
        return numStr.tofloat();
    } else {
        return numStr.tointeger();
    }
}

// 解析数组
function parseArray() {
    if (error) return null;
    if (!expectChar('[')) return null;
    skipWhitespace();
    local arr = [];
    if (pos < len && str[pos] == ']') {
        pos++;
        return arr;
    }
    while (!error) {
        skipWhitespace();
        local val = parseValue();
        if (error) return null;
        arr.append(val);
        skipWhitespace();
        if (pos >= len) {
            error = true;
            AILog.Error("sourceToTable: Unterminated array");
            return null;
        }
        local ch = str[pos];
        if (ch == ',') {
            pos++;
            skipWhitespace();
            continue;
        } else if (ch == ']') {
            pos++;
            break;
        } else {
            error = true;
            AILog.Error("sourceToTable: Expected ',' or ']' in array");
            return null;
        }
    }
    return arr;
}

// 解析表
function parseTable() {
    if (error) return null;
    if (!expectChar('{')) return null;
    skipWhitespace();
    local table = {};
    if (pos < len && str[pos] == '}') {
        pos++;
        return table;
    }
    while (!error) {
        skipWhitespace();
        if (str[pos] != '"') {
            error = true;
            AILog.Error("sourceToTable: Expected string key in table");
            return null;
        }
        local key = parseString();
        if (error) return null;
        skipWhitespace();
        if (!expectChar('=')) return null;
        skipWhitespace();
        local val = parseValue();
        if (error) return null;
        table[key] <- val;
        skipWhitespace();
        if (pos >= len) {
            error = true;
            AILog.Error("sourceToTable: Unterminated table");
            return null;
        }
        local ch = str[pos];
        if (ch == ',') {
            pos++;
            skipWhitespace();
            continue;
        } else if (ch == '}') {
            pos++;
            break;
        } else {
            error = true;
            AILog.Error("sourceToTable: Expected ',' or '}' in table");
            return null;
        }
    }
    return table;
}

// 解析任意值（入口）
function parseValue() {
    if (error) return null;
    skipWhitespace();
    if (pos >= len) {
        error = true;
        AILog.Error("sourceToTable: Unexpected end of input");
        return null;
    }
    local ch = str[pos];
    if (ch == '"') {
        return parseString();
    } else if (ch == '[') {
        return parseArray();
    } else if (ch == '{') {
        return parseTable();
    } else if (ch == 'n') {
        if (pos + 3 < len && str.slice(pos, pos+4) == "null") {
            pos += 4;
            return null;
        } else {
            error = true;
            AILog.Error("sourceToTable: Expected 'null'");
            return null;
        }
    } else if (ch == 't') {
        if (pos + 3 < len && str.slice(pos, pos+4) == "true") {
            pos += 4;
            return true;
        } else {
            error = true;
            AILog.Error("sourceToTable: Expected 'true'");
            return null;
        }
    } else if (ch == 'f') {
        if (pos + 4 < len && str.slice(pos, pos+5) == "false") {
            pos += 5;
            return false;
        } else {
            error = true;
            AILog.Error("sourceToTable: Expected 'false'");
            return null;
        }
    } else if ((ch >= '0' && ch <= '9') || ch == '-') {
        return parseNumber();
    } else {
        error = true;
        AILog.Error("sourceToTable: Unexpected character '" + ch + "' at position " + pos);
        return null;
    }
}


