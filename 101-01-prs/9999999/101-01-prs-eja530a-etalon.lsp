;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-eja530a-etalon

( / adoc dcl-id list-10 list-15 list-16 list-17 list-18 list-20 list-21 list-22 list-23 list-24 list-31 list-32 list-33 list-34 num-lin 
pnt-ins txt-10 txt-11 txt-12 txt-13 txt-14 txt-15 txt-15-1 txt-15-2 txt-16 txt-16-1 txt-17 txt-17-1 txt-17-2 txt-17-3 txt-18 txt-18-1 
txt-18-2 txt-20 txt-20-1 txt-20-2 txt-21 txt-21-1 txt-21-2 txt-22 txt-22-1 txt-22-2 txt-23 txt-23-1 txt-23-2 txt-24 txt-24-1 txt-24-2 
txt-31 txt-31-1 txt-31-2 txt-ins-1 txt-ins-2 x-pnt-ins y-pnt-ins ypnt-ins-1)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq num-lin 17 ;количество строк
      list-10 (list "Вода" "Насыщенный пар" "Перегретый пар" "Газ природный" "Нефть" "Кислород" "Мазут")
      list-15 (list "4...20мА, HART" "4...20мА, BRAIN" "FOUNDATION Fieldbus")
      list-16 (list "Нет" "Корнеизвлечение" "Инверсный")
      list-17 (list "0...200 кПа (10...200)" "0...2 МПа (0,1...2)" "0...10 МПа (0,5...10)" "0...50 МПа (5...50)")
      list-18 (list "0,2" "0,075")
      list-20 (list "Нерж. сталь SUS316L (штуцер), Hastelloy C-276 (диафр.)" "Hastelloy C-276 (штуцер), Hastelloy C-276 (диафр.)")
      list-21 (list "Штуцер, наруж. резьба М20х1,5"
                    "Штуцер, внутр. резьба К1/2 (NPT) ГОСТ 6111-52"
                    "Штуцер, наруж. резьба К1/2 (NPT) ГОСТ 6111-52"
                    "Штуцер, наруж. резьба G1/2 (BSP) ГОСТ 6357-81")
      list-22 (list "М20х1,5"
                    "G1/2 (BSP) ГОСТ 6357-81"
                    "К1/2 (NPT) ГОСТ 6111-52"
                    "Pg 13,5")
      list-23 (list "ЖК дисплей" "ЖК дисплей, переключ. шкалы" "Отсутствует")
      list-24 (list "Обычное, IP67" "0ExiaIICT5X" "1ExdIICT4...T6")
      list-31 (list "Углеродистая сталь" "Нет" "Нержавеющая сталь")
      list-32 (list "Нет"
                    "Обезжиривание контактирующих частей"
                    "Обезжиривание контактирующих частей, гидрозаполнение фторированным маслом")
      list-33 (list "Нет" "Бар" "Кгс/см2")      
      list-34 (list "Нет" "Нержавеющая сталь SCS14A")
);setq

(if (< (setq dcl-id (load_dialog "dia-101-eja530a-etalon.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_eja_530_etalon" dcl-id))
		(exit)
);if

;среда
(list-filling "txt-10" list-10)
(set_tile "txt-10" "0")

;диапазон шкалы датчика
(list-filling "txt-15" list-15)
(set_tile "txt-15" "0")

;погрешность
(list-filling "txt-16" list-16)
(set_tile "txt-16" "0")

;протокол
(list-filling "txt-17" list-17)
(set_tile "txt-17" "0")

(list-filling "txt-18" list-18)
(set_tile "txt-18" "0")

;индикатор
(list-filling "txt-20" list-20)
(set_tile "txt-20" "0")

(list-filling "txt-21" list-21)
(set_tile "txt-21" "0")

(list-filling "txt-22" list-22)
(set_tile "txt-22" "0")

(list-filling "txt-23" list-23)
(set_tile "txt-23" "0")

(list-filling "txt-24" list-24)
(set_tile "txt-24" "0")

(list-filling "txt-31" list-31)
(set_tile "txt-31" "0")

(list-filling "txt-32" list-32)

(list-filling "txt-33" list-33)

(list-filling "txt-34" list-34)

(action_tile "txt-15" ;выбор выходного сигнала
  (strcat "(tmp-1-101-eja530a-etalon $value)"
  );strcat
);action_tile

(action_tile "txt-17" ;выбор выходного сигнала
  (strcat "(tmp-2-101-eja530a-etalon $value)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(setq txt-10 (nth (atoi (get_tile \"txt-10\")) list-10))"
          "(setq txt-11 (get_tile \"txt-11\"))"
          "(setq txt-12 (get_tile \"txt-12\"))"
          "(setq txt-13 (get_tile \"txt-13\"))"
          "(setq txt-14 (get_tile \"txt-14\"))"
          "(setq txt-15 (nth (atoi (get_tile \"txt-15\")) list-15))"
          "(setq txt-16 (nth (atoi (get_tile \"txt-16\")) list-16))"
          "(setq txt-17 (nth (atoi (get_tile \"txt-17\")) list-17))"
          "(setq txt-18 (nth (atoi (get_tile \"txt-18\")) list-18))"
          "(setq txt-20 (nth (atoi (get_tile \"txt-20\")) list-20))"
          "(setq txt-21 (nth (atoi (get_tile \"txt-21\")) list-21))"
          "(setq txt-22 (nth (atoi (get_tile \"txt-22\")) list-22))"
          "(setq txt-23 (nth (atoi (get_tile \"txt-23\")) list-23))"
          "(setq txt-24 (nth (atoi (get_tile \"txt-24\")) list-24))"
          "(setq txt-31 (nth (atoi (get_tile \"txt-31\")) list-31))"
          ;"(setq txt-32 (nth (atoi (get_tile \"txt-32\")) list-32))"
          ;"(setq txt-33 (nth (atoi (get_tile \"txt-33\")) list-33))"
          ;"(setq txt-34 (nth (atoi (get_tile \"txt-34\")) list-34))"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "cancel"
  (strcat "(done_dialog)"
          "(exit)")
);action_tile

(start_dialog)
(unload_dialog dcl-id)


;//////////////////////////////////////////////////
(if (= txt-15 "4...20мА, HART")
  (setq txt-15-1 "-E"
        txt-15-2 "- выходной сигнал 4...20мА, HART"
  );setq
);if

(if (= txt-15 "4...20мА, BRAIN")
  (setq txt-15-1 "-D"
        txt-15-2 "- выходной сигнал 4...20мА, BRAIN"
  );setq
);if

(if (= txt-15 "FOUNDATION Fieldbus")
  (setq txt-15-1 "-F"
        txt-15-2 "- выходной сигнал FOUNDATION Fieldbus"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-16 "Нет")  
  (setq txt-16-1 "- выходной сигнал без корнеизвлечения, без инверсии"
  );setq
);if

(if (= txt-16 "Корнеизвлечение")
  (setq txt-16-1 "- выходной сигнал с корнеизвлечением"
  );setq
);if

(if (= txt-16 "Инверсный")
  (setq txt-16-1 "- выходной сигнал инверсный"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-17 "0...200 кПа (10...200)")
  (setq txt-17-1 "A"
        txt-17-2 "- пределы измерений датчика 0...200 кПа"
        txt-17-3 "- пределы перенастройки 10...200 кПа"
  );setq
);if

(if (= txt-17 "0...2 МПа (0,1...2)")
  (setq txt-17-1 "B"
        txt-17-2 "- пределы измерений датчика 0...2 МПа"
        txt-17-3 "- пределы перенастройки 0,1...2 МПа"
  );setq
);if

(if (= txt-17 "0...10 МПа (0,5...10)")
  (setq txt-17-1 "C"
        txt-17-2 "- пределы измерений датчика 0...10 МПа"
        txt-17-3 "- пределы перенастройки 0,5...10 МПа"
  );setq
);if

(if (= txt-17 "0...50 МПа (5...50)")
  (setq txt-17-1 "D"
        txt-17-2 "- пределы измерений датчика 0...50 МПа"
        txt-17-3 "- пределы перенастройки 5...50 МПа"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-18 "0,075") 
  (setq txt-18-1 "/HAC"
        txt-18-2 "- погрешность приведенная 0,075"
  );setq
);if

(if (= txt-18 "0,12")
  (setq txt-18-1 "/HAC"
        txt-18-2 "- погрешность приведенная 0,12"
  );setq
);if

(if (= txt-18 "0,2")
  (setq txt-18-1 ""
        txt-18-2 "- погрешность приведенная 0,2"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-20 "Нерж. сталь SUS316L (штуцер), Hastelloy C-276 (диафр.)")  
  (setq txt-20-1 "S"
        txt-20-2 "- материал частей нерж. сталь SUS316L (штуцер), Hastelloy C-276 (диафр.)"
  );setq
);if

(if (= txt-20 "Hastelloy C-276 (штуцер), Hastelloy C-276 (диафр.)")
  (setq txt-20-1 "H"
        txt-20-2 "- материал частей Hastelloy C-276 (штуцер), Hastelloy C-276 (диафр.)"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-21 "Штуцер, наруж. резьба М20х1,5")
  (setq txt-21-1 "9"
        txt-21-2 "- присоединение к процессу штуцер, наруж. резьба М20х1,5"
  );setq
);if

(if (= txt-21 "Штуцер, внутр. резьба К1/2 (NPT) ГОСТ 6111-52")
  (setq txt-21-1 "4"
        txt-21-2 "- присоединение к процессу штуцер, внутр. резьба К1/2 (NPT) ГОСТ 6111-52"
  );setq
);if

(if (= txt-21 "Штуцер, наруж. резьба К1/2 (NPT) ГОСТ 6111-52")
  (setq txt-21-1 "7"
        txt-21-2 "- присоединение к процессу штуцер, наруж. резьба К1/2 (NPT) ГОСТ 6111-52"
  );setq
);if

(if (= txt-21 "Штуцер, наруж. резьба G1/2 (BSP) ГОСТ 6357-81")
  (setq txt-21-1 "8"
        txt-21-2 "- присоединение к процессу штуцер, наруж. резьба G1/2 (BSP) ГОСТ 6357-81"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-22 "М20х1,5")               
  (setq txt-22-1 "4"
        txt-22-2 "- кабельный ввод М20х1,5"
  );setq
);if

(if (= txt-22 "G1/2 (BSP) ГОСТ 6357-81")
  (setq txt-22-1 "5"
        txt-22-2 "- кабельный ввод G1/2 (BSP) ГОСТ 6357-81"  
  );setq
);if

(if (= txt-22 "К1/2 (NPT) ГОСТ 6111-52")
  (setq txt-22-1 "7"
        txt-22-2 "- кабельный ввод К1/2 (NPT) ГОСТ 6111-52"
  );setq
);if

(if (= txt-22 "Pg 13,5")
  (setq txt-22-1 "8"
        txt-22-2 "- кабельный ввод Pg 13,5"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-23 "Отсутствует") 
  (setq txt-23-1 "N"
        txt-23-2 "- индикатор отсутствует"
  );setq
);if

(if (= txt-23 "ЖК дисплей")
  (setq txt-23-1 "D"
        txt-23-2 "- индикатор стандартный"
  );setq
);if

(if (= txt-23 "ЖК дисплей, переключ. шкалы")
  (setq txt-23-1 "E"
        txt-23-2 "- индикатор стандартный, с переключателем шкалы"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-24 "Обычное, IP67")                  
  (setq txt-24-1 ""
        txt-24-2 "- взрывозащита без взрывозащиты"
  );setq
);if

(if (= txt-24 "0ExiaIICT5X")
  (setq txt-24-1 "/KS2"
        txt-24-2 "- взрывозащита 0ExiaIICT5X (искробезопасная цепь)"
  );setq
);if

(if (= txt-24 "1ExdIICT4...T6")
  (setq txt-24-1 "/KF2"
        txt-24-2 "- взрывозащита 1ExdIICT4...T6 (взрывонепроницаемая оболочка)"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-31 "Нет")                  
  (setq txt-31-1 "N"
        txt-31-2 "- монтажный кронштейн нет"
  );setq
);if

(if (= txt-31 "Углеродистая сталь")
  (setq txt-31-1 "E"
        txt-31-2 "- монтажный кронштейн углеродистая сталь"
  );setq
);if

(if (= txt-31 "Нержавеющая сталь")
  (setq txt-31-1 "F"
        txt-31-2 "- монтажный кронштейн нержавеющая сталь"
  );setq
);if

(setq txt-ins-1 (strcat "EJA530A" txt-15-1 txt-17-1 txt-20-1 txt-21-1 "N-0" txt-22-1 txt-23-1 txt-31-1 "/EP/QR")
      txt-ins-2 (strcat txt-18-1 txt-24-1)
);setq

;отрисовка строк спецификации
(101-empt-lin-spcf)
(setvar "osmode" 6199)
(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	    x-pnt-ins (nth 0 pnt-ins)
	    y-pnt-ins (nth 1 pnt-ins)
	    ypnt-ins-1 y-pnt-ins
);setq
(setvar "osmode" 0)
(setvar "cmdecho" 0)
(repeat num-lin
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins ypnt-ins-1))
  (setq ypnt-ins-1 (- ypnt-ins-1 8)
  );setq
);repeat

(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 "Датчик давления");наименование

(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 12)) 2.5 0 (strcat "- измеряемая среда " (strcase txt-10 4)))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 20)) 2.5 0 (strcat "- температура измеряемой среды " txt-11 "..." txt-12 " %%dC"))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 28)) 2.5 0 (strcat "- температура окружающей среды " txt-13 "..." txt-14 " %%dC"))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 36)) 2.5 0 (strcat txt-15-2))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 44)) 2.5 0 (strcat txt-16-1))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 52)) 2.5 0 (strcat txt-17-2))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 60)) 2.5 0 (strcat txt-17-3))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 68)) 2.5 0 (strcat txt-20-2))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 76)) 2.5 0 (strcat txt-21-2))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 84)) 2.5 0 (strcat txt-22-2))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 92)) 2.5 0 (strcat txt-23-2))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 100)) 2.5 0 (strcat txt-31-2))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 108)) 2.5 0 (strcat txt-24-2))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 116)) 2.5 0 (strcat txt-18-2))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 124)) 2.5 0 "- государственная поверка")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 txt-ins-1);код заказа
(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 12)) 2.5 0 txt-ins-2)

(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество

(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "\"ЭТАЛОН-ПРИБОР\",");производитель
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 12)) 2.5 0 "г. Челябинск")

(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 4)) 2.5 0 "№14495-09 в Госреестре");сертификат
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 12)) 2.5 0 "средств измерений,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 20)) 2.5 0 "свидетельство,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 28)) 2.5 0 "об утверждении типа")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 36)) 2.5 0 "средств измерений")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 44)) 2.5 0 "JP.C.30.004.A №38504")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 52)) 2.5 0 "от 15.03.2010г.,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 60)) 2.5 0 "разрешение")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 68)) 2.5 0 "Ростехнадзора")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 76)) 2.5 0 "на применение")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 84)) 2.5 0 "№ РРС 00-32124")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 92)) 2.5 0 "от 24.11.2008г.")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun list-filling
(name-list data-list / )

(progn
  (start_list name-list)
  (mapcar 'add_list data-list)
  (end_list)
);progn

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-1-101-eja530a-etalon
($value / type-1)

(setq type-1 (nth (atoi $value) list-15)
);setq

(if (= "FOUNDATION Fieldbus" type-1)
  (setq list-24 (list "Обычное, IP67")
  );setq
);if

(if (/= "FOUNDATION Fieldbus" type-1)
  (setq list-24 (list "Обычное, IP67" "0ExiaIICT5X" "1ExdIICT4...T6")
  );setq
);if

(list-filling "txt-24" list-24)
(set_tile "txt-24" "0")

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-2-101-eja530a-etalon
($value / type-1)

(setq type-1 (nth (atoi $value) list-17)
);setq

(if (= "0...50 МПа (5...50)" type-1)
  (setq list-18 (list "0,12")
  );setq
);if

(if (/= "0...50 МПа (5...50)" type-1)
  (setq list-18 (list "0,2" "0,075")
  );setq
);if

(list-filling "txt-18" list-18)
(set_tile "txt-18" "0")

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////