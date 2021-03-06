import Base.Dates: now, unix2datetime, Second

doc"""
`DateTime(::ZonedDateTime) -> DateTime`

Returns an equivalent `DateTime` without any `TimeZone` information.
"""
DateTime(zdt::ZonedDateTime) = localtime(zdt)
@vectorize_1arg ZonedDateTime DateTime

doc"""
`now(::TimeZone) -> ZonedDateTime`

Returns a `ZonedDateTime` corresponding to the user's system time in the specified `TimeZone`.
"""
function now(tz::TimeZone)
    utc = trunc(unix2datetime(time()), Second)
    ZonedDateTime(utc, tz, from_utc=true)
end
