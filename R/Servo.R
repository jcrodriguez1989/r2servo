#' Servo Class Representation.
#'
#' @slot pin The servo's assigned pin.
#' @slot servo The internal representation of the servo.
#'
#' @importFrom methods setClass
#'
setClass(
  "Servo",
  slots = c(
    # integer or character
    pin = "ANY",
    # gpiozero Servo class
    servo = "ANY"
  )
)
