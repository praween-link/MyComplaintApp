String timeFormat(int hour, int minute) {
  int timeHr = hour == 0
      ? 12
      : hour > 12
          ? hour - 12
          : hour;
  String time = "$timeHr:${minute<10?'0$minute' : minute} ${hour < 12 ? 'am' : 'pm'}";
  return time;
}
