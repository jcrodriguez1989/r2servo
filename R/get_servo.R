#' Get a servo instance.
#'
#' Returns a configured servo instance.
#'
#' @param pin A character or numeric of length one with the GPIO pin that the
#'   servo is connected to.
#' @param initial_value A numeric of length one. If 0 (the default), the
#'   device's mid-point will be set initially. Other values between -1 and +1
#'   can be specified as an initial position. If `NULL`, it will not move.
#'
#' @return A Servo S4 object, this object will be set to work with the
#'   configured servo.
#'
#' @examples
#' \dontrun{
#' # Get a servo instance connected at GPIO 14.
#' servo_14 <- get_servo(14)
#' # Get a servo instance connected at GPIO 18.
#' servo_18 <- get_servo(18)
#' }
#'
#' @export
#'
get_servo <- function(pin, initial_value = 0) {
  configured_servos$get_servo(pin, initial_value)
}
