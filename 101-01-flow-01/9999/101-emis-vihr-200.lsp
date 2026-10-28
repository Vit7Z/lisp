;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// эмис-вихрь 200                                                    /////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:101-emis-vihr-200

( / adoc dcl-id list-11 list-12 list-13 list-14 list-15 list-16 list-17 list-21 list-22 list-23 list-24 list-25 list-26 pnt-ins txt-11 
txt-11-1 txt-12 txt-12-1 txt-13 txt-14 txt-14-1 txt-15 txt-15-1 txt-16 txt-16-1 txt-17 txt-17-1 txt-21 txt-21-1 txt-22 txt-23 txt-23-1 
txt-24 txt-24-1 txt-25 txt-25-1 txt-26 txt-26-1 x-pnt-ins y-pnt-ins ypnt-ins-1)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-11 (list "Без взрывозащиты" "1ExibIIB (T1-T5)X"  "1ExibIIC (T1-T5)X" "1ExdIIC (T1-T5)X")
      list-12 (list "15" "25" "32" "40" "50" "80" "100" "150" "200" "250"  "300")
      list-13 (list "А" "Б")
      list-14 (list "Стандартный" "Спец. заказ")
      list-15 (list "Жидкость" "Газ (пар)" "Кислород")
      list-16 (list "Нержавеющая сталь" "Hastelloy" "Спец. заказ")
      list-17 (list "Фланцевое" "Сэндвич (Ду15-Ду100)" "Фланцевое со встроен. переходами (Ду25-Ду100)" "Спец. заказ")
      list-21 (list "Совместное"  "Дистанцион.")
      list-22 (list "1,6"  "2,5" "4,0" "6,3")
      list-23 (list "-40...+250" "-200...+50" "-40...+100" "-40...+320" "-40...+460")
      list-24 (list "Да" "Нет")
      list-25 (list "0...1000Гц, RS-485" "0...1000Гц, RS-485, 4-20мА")
      list-26 (list "Государственная" "Заводская")
);setq

(if (< (setq dcl-id (load_dialog "101-dia-emis-vihr-200.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_emis_vihr_200" dcl-id))
		(exit)
);if

(list-filling "txt-11" list-11)
(set_tile "txt-11" "0")

(list-filling "txt-12" list-12)
(set_tile "txt-12" "0")

(list-filling "txt-13" list-13)
(set_tile "txt-13" "0")

(list-filling "txt-14" list-14)
(set_tile "txt-14" "0")

(list-filling "txt-15" list-15)
(set_tile "txt-15" "0")

(list-filling "txt-16" list-16)
(set_tile "txt-16" "0")

(list-filling "txt-17" list-17)
(set_tile "txt-17" "0")

(list-filling "txt-21" list-21)
(set_tile "txt-21" "0")

(list-filling "txt-22" list-22)
(set_tile "txt-22" "0")

(list-filling "txt-23" list-23)
(set_tile "txt-23" "0")

(list-filling "txt-24" list-24)
(set_tile "txt-24" "0")

(list-filling "txt-25" list-25)
(set_tile "txt-25" "0")

(list-filling "txt-26" list-26)
(set_tile "txt-26" "0")

(action_tile "accept"
  (strcat "(setq txt-11 (nth (atoi (get_tile \"txt-11\")) list-11))"
          "(setq txt-12 (nth (atoi (get_tile \"txt-12\")) list-12))"
          "(setq txt-13 (nth (atoi (get_tile \"txt-13\")) list-13))"
          "(setq txt-14 (nth (atoi (get_tile \"txt-14\")) list-14))"
          "(setq txt-15 (nth (atoi (get_tile \"txt-15\")) list-15))"
          "(setq txt-16 (nth (atoi (get_tile \"txt-16\")) list-16))"
          "(setq txt-17 (nth (atoi (get_tile \"txt-16\")) list-17))"
          "(setq txt-21 (nth (atoi (get_tile \"txt-21\")) list-21))"
          "(setq txt-22 (nth (atoi (get_tile \"txt-22\")) list-22))"
          "(setq txt-23 (nth (atoi (get_tile \"txt-23\")) list-23))"
          "(setq txt-24 (nth (atoi (get_tile \"txt-24\")) list-24))"
          "(setq txt-25 (nth (atoi (get_tile \"txt-25\")) list-25))"
          "(setq txt-26 (nth (atoi (get_tile \"txt-26\")) list-26))"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "cancel"
  (strcat "(done_dialog)"
          "(exit)"
  );stcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

;//////////////////////////////////////////////////
(if (= txt-11 "Без взрывозащиты")
  (setq txt-11-1 (strcase txt-11 1)
        txt-11 "-"
  );setq
);if

(if (= txt-11 "1ExibIIB (T1-T5)X")
  (setq txt-11 "ExB"
        txt-11-1 "1ExibIIB (T1-T5)X"
  );setq
);if

(if (= txt-11 "1ExibIIC (T1-T5)X")
  (setq txt-11 "ExC"
        txt-11-1 "1ExibIIC (T1-T5)X"
  );setq
);if

(if (= txt-11 "1ExdIIC (T1-T5)X")
  (setq txt-11 "Вн"
        txt-11-1 "1ExdIIC (T1-T5)X"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-12 "15")
  (setq txt-12 "015"
        txt-12-1 "15"
  );setq
);if

(if (= txt-12 "25")
  (setq txt-12 "025"
        txt-12-1 "25"
  );setq
);if

(if (= txt-12 "32")
  (setq txt-12 "032"
        txt-12-1 "32"
  );setq
);if

(if (= txt-12 "40")
  (setq txt-12 "040"
        txt-12-1 "40"
  );setq
);if

(if (= txt-12 "50")
  (setq txt-12 "050"
        txt-12-1 "50"
  );setq
);if

(if (= txt-12 "80")
  (setq txt-12 "080"
        txt-12-1 "80"
  );setq
);if

(if (= txt-12 "100")
  (setq txt-12-1 "100"
  );setq
);if

(if (= txt-12 "150")
  (setq txt-12-1 "150"
  );setq
);if

(if (= txt-12 "200")
  (setq txt-12-1 "200"
  );setq
);if

(if (= txt-12 "250")
  (setq txt-12-1 "250"
  );setq
);if

(if (= txt-12 "300")
  (setq txt-12-1 "300"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-14 "Стандартный")
  (setq txt-14-1 (strcase txt-14 1)
        txt-14 "-"
  );setq
);if

(if (= txt-14 "Спец. заказ")
  (setq txt-14-1 (strcase txt-14 1)
        txt-14 "X"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-15 "Жидкость")
  (setq txt-15-1 (strcase txt-15 1)
        txt-15 "Ж"
  );setq
);if

(if (= txt-15 "Газ (пар)")
  (setq txt-15-1 (strcase txt-15 1)
        txt-15 "Г"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-16 "Нержавеющая сталь")
  (setq txt-16-1 (strcase txt-16 1)
        txt-16 "Н"
  );setq
);if

(if (= txt-16 "Hastelloy")
  (setq txt-16-1 (strcase txt-16 1)
        txt-16 "Н"
  );setq
);if

(if (= txt-16 "Спец. заказ")
  (setq txt-16-1 (strcase txt-16 1)
        txt-16 "Х"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-17 "Фланцевое")
  (setq txt-17-1 (strcase txt-17 1)
        txt-17 "Ф"
  );setq
);if

(if (= txt-17 "Сэндвич (Ду15-Ду100)")
  (setq txt-17 "С"
        txt-17-1 "cэндвич"
  );setq
);if

(if (= txt-17 "Фланцевое со встроен. переходами (Ду25-Ду100)")
  (setq txt-17 "ФР"
        txt-17-1 "фланцевое со встроен. переходамич"
  );setq
);if

(if (= txt-17 "Спец. заказ")
  (setq txt-17-1 (strcase txt-17 1)
        txt-17 "Х"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-21 "Совместное")
  (setq txt-21-1 (strcase txt-21 1)
        txt-21 "-"
  );setq
);if

(if (= txt-21 "Дистанцион.")
  (setq txt-21 "Д"
        txt-21-1 "дистанционное (длина кабеля 3м.)"
  );setq
);if
  
;//////////////////////////////////////////////////
(if (= txt-23 "-40...+250")
  (setq txt-23 "250"
        txt-23-1 "-40...+250"
  );setq
);if  
  
(if (= txt-23 "-200...+50")
  (setq txt-23 "50"
        txt-23-1 "-200...+50"
  );setq
);if  
  
(if (= txt-23 "-40...+100")
  (setq txt-23 "100"
        txt-23-1 "-40...+100"
  );setq
);if

(if (= txt-23 "-40...+320")
  (setq txt-23 "320"
        txt-23-1 "-40...+320"
  );setq
);if
  
(if (= txt-23 "-40...+460")
  (setq txt-23 "460"
        txt-23-1 "-40...+460"
  );setq
);if
  
;//////////////////////////////////////////////////
(if (= txt-24 "Да")
  (setq txt-24-1 (strcase txt-24 1)
        txt-24 "СИ"
  );setq
);if    
  
(if (= txt-24 "Нет")
  (setq txt-24-1 (strcase txt-24 1)
        txt-24 "-"
  );setq
);if
  
;//////////////////////////////////////////////////
(if (= txt-25 "0...1000Гц, RS-485")
  (setq txt-25 "-"
        txt-25-1 "0...1000Гц, RS-485"
  );setq
);if

(if (= txt-25 "0...1000Гц, RS-485, 4-20мА")
  (setq txt-25 "А"
        txt-25-1 "0...1000Гц, RS-485, 4-20мА"
  );setq
);if

;//////////////////////////////////////////////////
(if (= txt-26 "Государственная")
  (setq txt-26-1 (strcase txt-26 1)
        txt-26 "ГП"
  );setq
);if

(if (= txt-26 "Заводская")
  (setq txt-26-1 (strcase txt-26 1)
        txt-26 "-"
  );setq
);if

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setvar "osmode" 6199)
(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  x-pnt-ins (nth 0 pnt-ins)
	  y-pnt-ins (nth 1 pnt-ins)
	  ypnt-ins-1 y-pnt-ins
);setq

(101-empt-lin-spcf)

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(repeat 16
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins ypnt-ins-1))
  (setq ypnt-ins-1 (- ypnt-ins-1 8)
  );setq
);repeat

(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 "Преобразователь расхода");наименование
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 12)) 2.5 0 "- полнопроходной")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 20)) 2.5 0 (strcat "- исполнение    " txt-11-1))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 28)) 2.5 0 (strcat "- диаметр условного прохода трубопровода    " txt-12-1 "мм."))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 36)) 2.5 0 (strcat "- класс точности    " txt-13))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 44)) 2.5 0 (strcat "- диапазон расхода    " txt-14-1))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 52)) 2.5 0 (strcat "- измеряемая среда    " txt-15-1))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 60)) 2.5 0 (strcat "- материал проточной части    " txt-16-1))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 68)) 2.5 0 (strcat "- соединение с трубопроводом    " txt-17-1))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 76)) 2.5 0 (strcat "- размещение электронного преобразователя    " txt-21-1))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 84)) 2.5 0 (strcat "- номинальное давление среды    " txt-22 "МПа"))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 92)) 2.5 0 (strcat "- температура среды    " txt-23-1 "%%d"))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 100)) 2.5 0 (strcat "- индикатор    " txt-24-1))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 108)) 2.5 0 (strcat "- выходные сигналы    " txt-25-1))
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 116)) 2.5 0 (strcat "- поверка    " txt-26-1))

(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 "ЭМИС-ВИХРЬ 200")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 12)) 2.5 0 (strcat txt-11 " " txt-12 " " txt-13 " " txt-14 " " txt-15 " " txt-16 " " txt-17 " "
txt-21 " " txt-22 " " txt-23 " " txt-24 " " txt-25 " " txt-26))

(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество

(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "ЗАО \"ЭМИС\",");производитель
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 12)) 2.5 0 "г. Челябинск")

(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 4)) 2.5 0 "Внесен в Госреестр");сертификат
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 12)) 2.5 0 "средств измерений под")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 20)) 2.5 0 "№ 42775-09,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 28)) 2.5 0 "свидетельство")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 36)) 2.5 0 "RU.C.29.092.A, №37938")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 44)) 2.5 0 "Сертификат")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 52)) 2.5 0 "соответствия")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 60)) 2.5 0 "(Ex - приложение)")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 68)) 2.5 0 "№РОСС")  
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 76)) 2.5 0 "RU.ГБ06.B00667")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////