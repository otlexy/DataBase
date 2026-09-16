CREATE TABLE "Сотрудник"(
    "№ТК" BIGINT NOT NULL,
    "Фамилия" TEXT NOT NULL,
    "Дата Устройства" DATE NOT NULL,
    "Дата Рождения" DATE NOT NULL,
    "Адрес" TEXT NOT NULL,
    "Телефон" TEXT NOT NULL,
    "id Должности" BIGINT NOT NULL
);
ALTER TABLE
    "Сотрудник" ADD PRIMARY KEY("№ТК");
ALTER TABLE
    "Сотрудник" ADD CONSTRAINT "Сотрудник_Телефон_unique" UNIQUE("Телефон");
CREATE TABLE "ТипыРабот"(
    "id ТипаРаботы" BIGINT NOT NULL,
    "ТипРаботы" TEXT NOT NULL,
    "ОписаниеТипа" TEXT NOT NULL,
    "ЦенаЧаса" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "ТипыРабот" ADD PRIMARY KEY("id ТипаРаботы");
CREATE TABLE "ВыполненнаяРабота"(
    "id ВыполненнойРаботы" BIGINT NOT NULL,
    "№ТК" BIGINT NOT NULL,
    "id ТипаРаботы" BIGINT NOT NULL,
    "ДатаВыполнения" DATE NOT NULL,
    "Кол-воЧасов" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "ВыполненнаяРабота" ADD PRIMARY KEY("id ВыполненнойРаботы");
CREATE TABLE "ОсвобождениеОтНалога"(
    "id Льготы" BIGINT NOT NULL,
    "НазваниеЛьготы" TEXT NOT NULL,
    "ОписаниеЛьготы" TEXT NOT NULL
);
ALTER TABLE
    "ОсвобождениеОтНалога" ADD PRIMARY KEY("id Льготы");
ALTER TABLE
    "ОсвобождениеОтНалога" ADD CONSTRAINT "ОсвобождениеОтНалога_НазваниеЛьготы_unique" UNIQUE("НазваниеЛьготы");
CREATE TABLE "НачислениеЗП"(
    "id Операции" BIGINT NOT NULL,
    "№ТК" BIGINT NOT NULL,
    "id ВыполненнойРаботы" BIGINT NOT NULL,
    "id Ставки" BIGINT NOT NULL,
    "ДатаНачисления" DATE NOT NULL,
    "СуммаНачисления" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "НачислениеЗП" ADD PRIMARY KEY("id Операции");
CREATE TABLE "Должность"(
    "id Должности" BIGINT NOT NULL,
    "НазваниеДолжности" TEXT NOT NULL,
    "Описание" TEXT NOT NULL
);
ALTER TABLE
    "Должность" ADD PRIMARY KEY("id Должности");
ALTER TABLE
    "Должность" ADD CONSTRAINT "Должность_НазваниеДолжности_unique" UNIQUE("НазваниеДолжности");
CREATE TABLE "НалоговыеСтавки"(
    "id Ставки" BIGINT NOT NULL,
    "id Льготы" BIGINT NOT NULL,
    "НижняяГраница" INTEGER NOT NULL,
    "ВерхняяГраница" INTEGER NOT NULL,
    "СтавкаНалога" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "НалоговыеСтавки" ADD PRIMARY KEY("id Ставки");
ALTER TABLE
    "НалоговыеСтавки" ADD CONSTRAINT "НалоговыеСтавки_id Льготы_foreign" FOREIGN KEY("id Льготы") REFERENCES "ОсвобождениеОтНалога"("id Льготы");
ALTER TABLE
    "ВыполненнаяРабота" ADD CONSTRAINT "ВыполненнаяРабота_id ТипаРаботы_foreign" FOREIGN KEY("id ТипаРаботы") REFERENCES "ТипыРабот"("id ТипаРаботы");
ALTER TABLE
    "НачислениеЗП" ADD CONSTRAINT "НачислениеЗП_№ТК_foreign" FOREIGN KEY("№ТК") REFERENCES "Сотрудник"("№ТК");
ALTER TABLE
    "НачислениеЗП" ADD CONSTRAINT "НачислениеЗП_id Ставки_foreign" FOREIGN KEY("id Ставки") REFERENCES "НалоговыеСтавки"("id Ставки");
ALTER TABLE
    "ВыполненнаяРабота" ADD CONSTRAINT "ВыполненнаяРабота_№ТК_foreign" FOREIGN KEY("№ТК") REFERENCES "Сотрудник"("№ТК");
ALTER TABLE
    "НачислениеЗП" ADD CONSTRAINT "НачислениеЗП_id ВыполненнойРаботы_foreign" FOREIGN KEY("id ВыполненнойРаботы") REFERENCES "ВыполненнаяРабота"("id ВыполненнойРаботы");
ALTER TABLE
    "Сотрудник" ADD CONSTRAINT "Сотрудник_id Должности_foreign" FOREIGN KEY("id Должности") REFERENCES "Должность"("id Должности");