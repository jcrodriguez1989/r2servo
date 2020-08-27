# The ConfiguredServos class contains a list of configured servos, this is to
# configure each servo pin at most once. In `gpiozero` Python library, if
# configuring a servo more than once, it gives an error.
ConfiguredServos <- setRefClass(
  "ConfiguredServos",
  fields = list(servos = "list")
)

#' @importFrom reticulate import
# Set ConfiguredServos methods.
ConfiguredServos$methods(
  # This function will configure the servo if it does not exist, if it does
  # exist, it will return it.
  # @param pin A character or numeric of length one with the GPIO pin that the
  #   servo is connected to.
  # @param initial_value A numeric of length one. Values between -1 and +1 can
  #   be specified as an initial position.
  get_servo = function(pin, initial_value) {
    pin_name <- as.character(pin)
    actual_servos <- servos
    if (!pin_name %in% names(actual_servos)) {
      # The servo was not configured, so do it.
      # Import the gpiozero Python library.
      # gpiozero <- import("gpiozero")
      # Create the servo Python instance.
      # servo_instance <- gpiozero$Servo(
      #   pin = as.integer(pin),
      #   initial_value = initial_value
      # )
      servo_instance <- list()
      # Set value to NULL, to stop crazy moving.
      servo_instance$value <- NULL
      # Create our representation class of a servo.
      servo <- new("Servo", pin = pin, servo = servo_instance)
      # Save the configured servo.
      actual_servos[[pin_name]] <- servo
      servos <<- actual_servos
    }
    # Return the saved servo.
    servos[[pin_name]]
  }
)

# Create one empty ConfiguredServos that will contain all the configured
# servos.
configured_servos <- ConfiguredServos$new()
