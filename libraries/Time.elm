-- Library for working with time. Type `Time` represents some number of
-- milliseconds.

module Time where

import Native.Time as T

type Time = Float

-- Units of time, making it easier to specify things like a
-- half-second `(second / 2)`.

ms : Time
ms = 1

second : Time
second = 1000 * ms

minute : Time
minute = 60 * second

hour : Time
hour = 60 * minute

inMss : Time -> Float
inMss t = t

inSeconds : Time -> Float
inSeconds t = t / second

inMinutes : Time -> Float
inMinutes t = t / minute

inHours : Time -> Float
inHours t = t / hour

-- Takes desired number of frames per second (fps). The resulting signal
-- gives a sequence of time deltas as quickly as possible until it reaches
-- the desired FPS. A time delta is the time between the last frame and the
-- current frame.
fps : Number -> Signal Time

-- Same as the fps function, but you can turn it on and off. Allows you
-- to do brief animations based on user input without major ineffeciencies.
-- The first time delta after a pause is always zero, no matter how long
-- the pause was. This way summing the deltas will actually give the amount
-- of time that the output signal has been running.
fpsWhen : Number -> Signal Bool -> Signal Time

-- Takes a time interval t. The resulting signal is the current time,
-- updated every t.
every : Time -> Signal Time