from typing import Any, Dict, List, Optional

type QueryID = int

class QueryList:
    running_query: List[QueryID] = []
    query_results: Dict[QueryID, Any] = {}
    current_id: QueryID = 0

    def __init__(self) -> None:
        pass

    def new_query(self) -> QueryID:
        """
        Create a new query and return the query id
        """
        self.current_id += 1
        self.running_query.append(self.current_id)
        return self.current_id

    def add_result(self, query_id: QueryID, result: Any) -> None:
        """
        add result when query returned.
        """
        self.running_query.remove(query_id)
        self.query_results[query_id] = result

    def check_result(self, query_id: QueryID) -> Optional[Any]:
        """
        Check if the result is exist.
        if the result is exist return the result, otherwise return None
        """
        return self.query_results.get(query_id)
