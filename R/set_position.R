#' Set the position of a servo instance.
#'
#' Sets the position of a given servo instance.
#'
#' @param x A Servo instance.
#' @param value A numeric of length one. The new position of the servo as a
#'   value between -1 (the minimum position) and +1 (the maximum position).
#'
#' @return The same Servo instance provided as input.
#'
#' @examples
#' \dontrun{
#' # Get a servo instance.
#' servo <- get_servo(14)
#' # Move the servo to its maximum position.
#' set_position(servo, 1)
#' # Move the servo to its minimum position.
#' set_position(servo, -1)
#' # Move the servo to its midium position.
#' set_position(servo, 0)
#' }
#'
#' @export
#'
setGeneric("set_position", function(x, value) standardGeneric("set_position"))
setMethod("set_position", "Servo", function(x, value) {
  if (value < -1 || 1 < value)
    stop("`value` should be NULL or between -1 and +1")
  x@servo$value <- value
  x
})
