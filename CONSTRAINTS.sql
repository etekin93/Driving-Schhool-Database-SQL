alter table client
add constraint [CHK_BIRTHDATE] check (datediff(year,birthdate,getdate()) >= 18)

alter table car
add constraint [CHKYEAR] check ( datediff ( year, modelyear,dateofpurchase) <= 5)

alter table scheduledlesson
add constraint [CHK_TIME] check( time >= '08:00' and time <='20:00')

alter table instructor
add constraint [UIX_DRISDI] unique(instructorlicenseid)