# The ConfiguredServos class contains a list of configured servos, this is to
# configure each servo pin at most once. In `gpiozero` Python library, if
# configuring a servo more than once, it throws an error.
ConfiguredServos <- setRefClass(
  "ConfiguredServos",
  fields = list(servos = "list")
)

#' @importFrom reticulate import
# @param pin A character or numeric of length one with the GPIO pin that the
#   servo is connected to.
# @param initial_value A numeric of length one. Values between -1 and +1 can
#   be specified as an initial position.
config_servo <- function(pin, initial_value) {
  # Import the gpiozero Python library.
  gpiozero <- import("gpiozero")
  # Create the servo Python instance.
  gpiozero$Servo(
    pin = as.integer(pin),
    initial_value = initial_value,
    # If this is not provided, then my servos start juddering:
    # https://www.raspberrypi.org/forums/viewtopic.php?t=174324
    pin_factory = gpiozero$pins$pigpio$PiGPIOFactory()
  )
}

# Set ConfiguredServos methods.
ConfiguredServos$methods(
  # This function will configure the servo if it does not exist, if it does
  # exist, it will return it.
  # @param pin A character or numeric of length one with the GPIO pin that the
  #   servo is connected to.
  # @param initial_value A numeric of length one. Values between -1 and +1 can
  #   be specified as an initial position.
  #' @importFrom methods new
  get_servo = function(pin, initial_value) {
    # Try to get the configured servo.
    pin_name <- as.character(pin)
    servo <- servos[[pin_name]]
    if (is.null(servo)) {
      # The servo was not configured, so do it.
      servo_instance <- config_servo(pin, initial_value)
      # Create our representation class of a servo.
      servo <- new("Servo", pin = pin, servo = servo_instance)
      # Save the configured servo.
      servos[[pin_name]] <<- servo
    } else {
      # If it exists, move it to the provided initial_value.
      servo@servo$value <- initial_value
    }
    servo
  }
)

# Create one empty ConfiguredServos that will contain all the configured
# servos.
configured_servos <- ConfiguredServos$new()
