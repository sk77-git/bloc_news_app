class DataResponse<T> {
  DataStatus status;
  T? response;
  String? message;

  DataResponse.initial([this.message])
      : status = DataStatus.initial,
        response = null;

  DataResponse.loading([this.message])
      : status = DataStatus.loading,
        response = null;

  DataResponse.loadingMore([this.message])
      : status = DataStatus.loadingMore,
        response = null;

  DataResponse.success(this.response)
      : status = DataStatus.success,
        message = null;

  DataResponse.error([this.message])
      : status = DataStatus.error,
        response = null;

  @override
  String toString() {
    return "Status : $status \nData : $response \nMessage : $message";
  }
}

enum DataStatus { initial, loading, success, error, loadingMore }
