#' Get a servo instance.
#'
#' Returns a configured servo instance.
#'
#' @param pin A character or numeric of length one with the GPIO pin that the
#'   servo is connected to.
#' @param initial_value A numeric of length one. If 0 (the default), the
#'   device's mid-point will be set initially. Other values between -1 and +1
#'   can be specified as an initial position.
#'
#' @return A Servo S4 object, this object will be set to work with the
#'   configured servo.
#'
#' @examples
#' \dontrun{
#' # If just one sensor connected, this would be the normal use case.
#' sensor <- get_ds18b20_sensor()
#'
#' # If two sensors connected, say "28-0300a2790676" and "28-0300a0881918".
#' sensor_1 <- get_ds18b20_sensor("28-0300a2790676")
#' sensor_2 <- get_ds18b20_sensor("28-0300a0881918")
#' }
#'
#' @export
#'
get_servo <- function(pin, initial_value = 0) {
  configured_servos$get_servo(pin, initial_value)
}
