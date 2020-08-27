#' Get the position of a servo instance.
#'
#' Gets the position of a given servo instance.
#'
#' @param x A Servo instance.
#'
#' @return A numeric of length one with the actual position of the servo.
#'
#' @examples
#' \dontrun{
#' # Get a servo instance with initial position 0.9
#' servo <- get_servo(14, 0.9)
#' # Read the position of the servo (should be 0.9).
#' get_position(servo)
#' }
#'
#' @export
#'
setGeneric("get_position", function(x) standardGeneric("get_position"))

#' @describeIn get_position
#'
#' @export
#'
setMethod("get_position", "Servo", function(x) {
  x@servo$value
})
