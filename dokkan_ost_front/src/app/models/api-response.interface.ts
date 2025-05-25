export interface ApiResponse<T> {
  data: T;
  nbPage: number;
  total: number;
}
