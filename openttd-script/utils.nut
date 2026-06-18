function SplitString(str, delimiter)
{
  local result = [];
  local start = 0;
  while (true) {
    local pos = str.find(delimiter, start);
    if (pos == null) {
      result.push(str.slice(start));
      break;
    }
    result.push(str.slice(start, pos));
    start = pos + delimiter.len();
  }
  return result;
}

