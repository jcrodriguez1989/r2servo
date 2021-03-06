% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_position.R
\name{get_position}
\alias{get_position}
\alias{get_position,Servo-method}
\title{Get the position of a servo instance.}
\usage{
get_position(x)

\S4method{get_position}{Servo}(x)
}
\arguments{
\item{x}{A Servo instance.}
}
\value{
A numeric of length one with the actual position of the servo.
}
\description{
Gets the position of a given servo instance.
}
\section{Methods (by class)}{
\itemize{
\item \code{Servo}: 
}}

\examples{
\dontrun{
# Get a servo instance with initial position 0.9
servo <- get_servo(14, 0.9)
# Read the position of the servo (should be 0.9).
get_position(servo)
}

}
