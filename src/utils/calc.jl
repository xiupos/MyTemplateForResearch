"""
Remove the noise in the number by rounding it to a specified number of digits.
"""
drop_noise(x::Number; DIGITS=14) = round(x, digits=DIGITS)
drop_noise(x::AbstractArray; DIGITS=14) = x .|> v -> drop_noise.(v; DIGITS)
