;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// сигнализаторы уровня                                         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-lvl-ros-301

( / adoc cnt-str dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-901 list-902 nmbr-vr str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 1)

(setq list-02 (list "Стержневой" "Тросовый")
      list-03 (list "1" "2" "6" "7" "8")
      list-04 (list "1,6" "2,5" "2,5" "6,3" "6,3")
      list-05 (list "150" "80" "250" "250" "350")
      list-06 (list "Нет" "0,1" "0,25" "0,6" "1,0" "1,6" "2,0")
      list-07 (list "Нет" "0,1" "0,25" "0,6" "1,0" "1,6" "2,0")
      list-08 (list "Нет" "0,1" "0,25" "0,6" "1,0" "1,6" "2,0")
     	list-09 (list "УХЛ3 (-50...+60)" "ОМ3 (-50...+60)" "Т3 (+10...+45)" "УХЛ4 (+1...+35)")
      list-10 (list "УХЛ2 (-50...+70)" "ОМ2 (-50...+70)" "Т2 (-50...+70)")
			list-901 nil
			list-902 nil
			str-01 nil
      cnt-str 0; начальное значение счетчика строк в списке для спецификаций
      nmbr-vr nil ;переключатель для печатания строк ПЭ или СПЦФ
);setq

(if (< (setq dcl-id (load_dialog "dia-101-01-lvl-ros-301.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_lvl_sgnl_device_ros_301" dcl-id))
		(exit)
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")

(action_tile "txt-02"
  (strcat "(txt-02-101-lvl-sgnl-device)");strcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-lvl-sgnl-device)");strcat
);action_tile
 
(action_tile "but1"
  (strcat "(tmp-filling-fields-101-lvl-sgnl-device)");strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but5"
  (strcat "(list-delete-item)");strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond 
	((= type-list "le") (le-101-lvl-sgnl-device));=
	((= type-list "spcf") (spcf-101-lvl-sgnl-device));=
	((= type-list "lecgv") (lecgv-101-lvl-sgnl-device));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-lvl-sgnl-device
( / str-01 str-02)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(cond 
		((= str-02 "Стержневой")
			(progn
				(setq list-03 (list "1" "2" "6" "7" "8")
							list-04 (list "1,6" "2,5" "2,5" "6,3" "6,3")
      				list-05 (list "150" "80" "250" "250" "350")
      				list-06 (list "Нет" "0,1" "0,25" "0,6" "1,0" "1,6" "2,0")
      				list-07 (list "Нет" "0,1" "0,25" "0,6" "1,0" "1,6" "2,0")
      				list-08 (list "Нет" "0,1" "0,25" "0,6" "1,0" "1,6" "2,0")
				);setq
				(list-filling "txt-06" list-06)
				(list-filling "txt-07" list-07)
				(list-filling "txt-08" list-08)
				(set_tile "txt-06" "0")
				(set_tile "txt-07" "0")
				(set_tile "txt-08" "0")
			);progn
		);=
		((= str-02 "Тросовый")
			(progn
				(setq list-03 (list "1Г" "2Г" "6Г")
							list-04 (list "1,6" "2,5" "2,5")
      				list-05 (list "150" "80" "250")
      				list-06 (list "Нет" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20")
      				list-07 (list "Нет" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20")
      				list-08 (list "Нет" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20")
				);setq
				(list-filling "txt-06" list-06)
				(list-filling "txt-07" list-07)
				(list-filling "txt-08" list-08)
				(set_tile "txt-06" "0")
				(set_tile "txt-07" "0")
				(set_tile "txt-08" "0")
			);progn
		);=
);cond


(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-lvl-sgnl-device
( / str-01)

(set_tile "txt-04" (get_tile "txt-03"))
(set_tile "txt-05" (get_tile "txt-03"))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-lvl-sgnl-device

( / cntr-1 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-100 str-902 str-99)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
			str-10 (nth (atoi (get_tile "txt-10")) list-10)
      cntr-1 0 ;счетчик, номер элемента в списке
);setq

(setq str-99 "2"	;масса преобразователя
			str-100 "0,65"	;масса датчика
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-902 (list (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08) (cons 9 str-09)	(cons 99 str-99) (cons 100 str-100))
			list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
			list-901 (vl-list* (strcat "Исполнение " str-03  "  "
																 "Электрод 1 " str-06 "  "
																 "Электрод 2 " str-07 "  "
																 "Электрод 3 " str-08 "  "
																 str-09) list-901)
);setq

(setq list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ рос-301           /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-lvl-sgnl-device

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp-1 str-tmp-11 str-tmp-21 str-tmp-22 str-tmp-3 str-tmp-6 str-tmp-7 str-tmp-8 str-tmp-9 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
				str-tmp-8 (cdr (assoc 8 str-tmp))
				str-tmp-9 (cdr (assoc 9 str-tmp))
				str-tmp-11 nil
				str-tmp-21 nil
				str-tmp-22 nil
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
				nmbr-ln 3
	); setq
	
	(100-empt-lin-le)
	
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
		
	(cond 
		((= str-tmp-9 "УХЛ3 (-50...+60)") (setq str-tmp-9 "УХЛ3"));=
		((= str-tmp-9 "ОМ3 (-50...+60)") (setq str-tmp-9 "ОМ3"));=
		((= str-tmp-9 "Т3 (+10...+45)") (setq str-tmp-9 "Т3"));=
		((= str-tmp-9 "УХЛ4 (+1...+35)") (setq str-tmp-9 "УХЛ4"));=
	);cond

	(slct-101-lvl-sgnl-device str-tmp-6 str-tmp-7 str-tmp-8) ;подпрограмма выбора печати количества строк, данных, сравнение данных

	(cond 
		((= nmbr-vr "0") 
			(progn
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Передающий преобразователь из состава")
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "сигнализатора уровня РОС-301")
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0  "1")
			);progn
		);=
	
		((= nmbr-vr "1x") 
			(progn
				(setq nmbr-ln (1+ nmbr-ln)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- передающий преобразователь")
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "1")
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1")
			);progn
		);=
	
		((= nmbr-vr "1y") 
			(progn
				(setq nmbr-ln (1+ nmbr-ln)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "1")
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1")
			);progn
		);=
	
		((= nmbr-vr "1z") 
			(progn
				(setq nmbr-ln (1+ nmbr-ln)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "1"))
			);progn
		);=

		((= nmbr-vr "2xy") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "1"))
			);progn
		);=
	
		((= nmbr-vr "2xz") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "1"))
			);progn
		);=

		((= nmbr-vr "2yz") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "1"))
			);progn
		);=
	
		((= nmbr-vr "x2") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 1)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "2"))
			);progn
		);=
	
		((= nmbr-vr "y2") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 1)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "2"))
			);progn
		);=

		((= nmbr-vr "2x2z") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "2"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "1"))
			);progn
		);=
	
		((= nmbr-vr "2x2y") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "2"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "1"))
			);progn
		);=
	
		((= nmbr-vr "2xy2") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "2"))
			);progn
		);=

		((= nmbr-vr "3xyz") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 3)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "1"))
			);progn
		);=
	
		((= nmbr-vr "1x3") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 1)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня РОС-301-" str-tmp-3 "-" str-tmp-9 " в составе:"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "1"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- датчик, длина " str-tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "3"))
			);progn
		);=
	);cond

	(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
	
	(repeat nmbr-ln
		(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(setq cntr-1 (1+ cntr-1));setq
);repeat
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма определения количесва строк     ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun slct-101-lvl-sgnl-device

(str-tmp-6 str-tmp-7 str-tmp-8)
;1
(if (and (= str-tmp-6 str-tmp-7) (= str-tmp-6 "Нет") (= str-tmp-7 str-tmp-8))
	(setq nmbr-vr "0");setq
);if

;2
(if (and (= str-tmp-7 str-tmp-8) (= str-tmp-7 "Нет") (/= str-tmp-6 str-tmp-7))
	(setq nmbr-vr "1x");setq
);if

;3
(if (and (= str-tmp-6 str-tmp-8) (= str-tmp-6 "Нет") (/= str-tmp-6 str-tmp-7))
	(setq nmbr-vr "1y");setq
);if

;4
(if (and (= str-tmp-6 str-tmp-7) (= str-tmp-6 "Нет") (/= str-tmp-8 "Нет"))
	(setq nmbr-vr "1z");setq
);if

;5
(if (/= str-tmp-6 str-tmp-7)
	(if (/= str-tmp-6 "Нет")
		(if (/= str-tmp-7 "Нет")
			(if (= str-tmp-8 "Нет")
				(setq nmbr-vr "2xy");setq
			);if
		);if
	);if
);if

;6
(if (/= str-tmp-6 str-tmp-8)
	(if (/= str-tmp-6 "Нет")
		(if (/= str-tmp-8 "Нет")
			(if (= str-tmp-7 "Нет")
				(setq nmbr-vr "2xz");setq
			);if
		);if
	);if
);if

;7
(if (= str-tmp-6 "Нет")
	(if (/= str-tmp-7 "Нет")
		(if (/= str-tmp-8 "Нет")
			(if (/= str-tmp-7 str-tmp-8)
				(setq nmbr-vr "2yz");setq
			);if
		);if
	);if
);if

;8
(if (= str-tmp-6 str-tmp-7)
	(if (/= str-tmp-6 "Нет")
		(if (= str-tmp-8 "Нет")
			(setq nmbr-vr "x2");setq
		);if
	);if
);if

;9
(if (= str-tmp-6 str-tmp-8)
	(if (/= str-tmp-6 "Нет")
		(if (= str-tmp-7 "Нет")
			(setq nmbr-vr "x2");setq
		);if
	);if
);if

;10
(if (= str-tmp-6 "Нет")
	(if (= str-tmp-7 str-tmp-8)
		(if (/= str-tmp-7 "Нет")
			(setq nmbr-vr "y2");setq
		);if
	);if
);if

;11
(if (/= str-tmp-6 "Нет")
	(if (/= str-tmp-7 "Нет")
		(if (/= str-tmp-8 "Нет")
			(if (/= str-tmp-6 str-tmp-7)
				(if (/= str-tmp-6 str-tmp-8)
					(if (/= str-tmp-7 str-tmp-8)
						(setq nmbr-vr "3xyz");setq
					);if
				);if
			);if
		);if
	);if
);if

;12
(if (= str-tmp-6 str-tmp-7)
	(if (/= str-tmp-6 "Нет")
		(if (/= str-tmp-8 "Нет")
			(if (/= str-tmp-6 str-tmp-8)
				(setq nmbr-vr "2x2z");setq
			);if
		);if
	);if
);if

;13
(if (= str-tmp-6 str-tmp-8)
	(if (/= str-tmp-6 str-tmp-7)
		(if (/= str-tmp-6 "Нет")
			(if (/= str-tmp-7 "Нет")
				(setq nmbr-vr "2x2y");setq
			);if
		);if
	);if
);if

;14
(if (/= str-tmp-6 str-tmp-7)
	(if (= str-tmp-7 str-tmp-8)
		(if (/= str-tmp-6 "Нет")
			(if (/= str-tmp-7 "Нет")
				(setq nmbr-vr "2xy2");setq
			);if
		);if
	);if
);if

;15
(if (= str-tmp-6 str-tmp-7)
	(if (= str-tmp-7 str-tmp-8)
		(if (/= str-tmp-6 "Нет")
			(setq nmbr-vr "1x3");setq
		);if
	);if
);if


(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun spcf-101-lvl-sgnl-device

( / cntr-1 dlt-y dt-21 nmbr-ln nmbr-vr pnt-ins str-tmp tmp-1 tmp-100 tmp-2 tmp-21 tmp-3 tmp-4 tmp-5 tmp-62 tmp-72 tmp-82 tmp-9 tmp-92 tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setvar "textstyle" "Standard")

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				tmp-1 "РОС-301"
				tmp-2 (cdr (assoc 2 str-tmp))
				tmp-3 (cdr (assoc 3 str-tmp))
				tmp-4 (cdr (assoc 4 str-tmp))
				tmp-5 (cdr (assoc 5 str-tmp))
				tmp-6 (cdr (assoc 6 str-tmp))
				tmp-7 (cdr (assoc 7 str-tmp))
				tmp-8 (cdr (assoc 8 str-tmp))
				tmp-9 (cdr (assoc 9 str-tmp))
				tmp-99 (cdr (assoc 99 str-tmp));масса вторичного прибора
				tmp-100 (cdr (assoc 100 str-tmp));масса датчика
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
				nmbr-ln 7
	); setq

	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(slct-101-lvl-sgnl-device tmp-6 tmp-7 tmp-8) ;подпрограмма выбора печати количества строк, данных, сравнение данных
	
	(cond 
		((= tmp-2 "Стержневой")
			(setq tmp-21 "стержневой"
			);setq
		);=
		((= tmp-2 "Тросовый")
			(setq tmp-21 "тросовый"
			);setq
		);=
	);cond
	
	(cond 
		((= tmp-9 "УХЛ3 (-50...+60)") (setq tmp-92 "УХЛ3"));=
		((= tmp-9 "ОМ3 (-50...+60)") (setq tmp-92 "ОМ3"));=
		((= tmp-9 "Т3 (+10...+45)") (setq tmp-92 "Т3"));=
		((= tmp-9 "УХЛ4 (+1...+35)") (setq tmp-92 "УХЛ4"));=
	);cond
	
	(cond 
		((= tmp-6 "Нет") (setq tmp-62 "0;"));=
		((/= tmp-6 "Нет") (setq tmp-62 (strcat tmp-6 ";")));=
	);cond
	
	(cond 
		((= tmp-7 "Нет") (setq tmp-72 "0;"));=
		((/= tmp-7 "Нет") (setq tmp-72 (strcat tmp-7 ";")));=
	);cond
	
	(cond 
		((= tmp-8 "Нет") (setq tmp-82 "0"));=
		((/= tmp-8 "Нет") (setq tmp-82 tmp-8));=
	);cond

	(if (= nmbr-vr "0") 
		(progn
			(setq dt-21 (strcat tmp-1 "-" tmp-3 "-" tmp-92)
						nmbr-ln 6
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня"))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- климатическое исполнение " tmp-9))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- в составе: "))
			(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "1")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 tmp-99);масса
			(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- без датчиков"))
		);progn
	);=
	
	(if (/= nmbr-vr "0") 
		(progn
			(setq dt-21 (strcat tmp-1 "-" tmp-3 "-" tmp-92 "-(" tmp-62 tmp-72 tmp-82 ")")
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор уровня"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- климатическое исполнение " tmp-9))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- тип датчика " tmp-21))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- температура среды " tmp-5 "%%dC"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- давление среды " tmp-4 "МПа"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- в составе: "))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
			(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- передающий преобразователь"))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 "1")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 tmp-99);масса
		);progn
	);=

	(cond 
		((= nmbr-vr "1x") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	
		((= nmbr-vr "1y") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	
		((= nmbr-vr "1z") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=

		((= nmbr-vr "2xy") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 3)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	
		((= nmbr-vr "2xz") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 3)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	
		((= nmbr-vr "2yz") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 3)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=

		((= nmbr-vr "x2") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "2")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	
		((= nmbr-vr "y2") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "2")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	
		((= nmbr-vr "2x2z") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 3)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "2")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	
		((= nmbr-vr "2x2y") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 3)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "2")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=

		((= nmbr-vr "2xy2") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 3)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "2")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	
		((= nmbr-vr "3xyz") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 4)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-7 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 tmp-100);масса датчика
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-8 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 "1")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	
		((= nmbr-vr "1x3") 
			(progn
				(setq nmbr-ln (+ nmbr-ln 2)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- датчик, длина " tmp-6 "м."))
				(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "шт.")
				(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "3")
				(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 tmp-100);масса датчика
			);progn
		);=
	);cond

	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 dt-21) ;Тип, марка, обозначение документа, опросного листа
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ТУ 25-2408.0009-88")	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ОАО \"Теплоприбор\",");производитель
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Рязань")
	
	(repeat nmbr-ln
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
		);setq
	);repeat

	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat
(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ОВШ рос-301           ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-lvl-sgnl-device

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp tmp-1 tmp-3 tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				tmp-3 (cdr (assoc 3 str-tmp))
				tmp-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
				nmbr-ln 3
	); setq
	
	(09-empt-lin-le-cgv)
	
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(setq nmbr-ln 3
	);setq
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Передающий преобразователь из"))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "состава сигнализатора уровня " tmp-1))
	
	(repeat nmbr-ln
		(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
		);setq
	);repeat
			
	(command "_text" "_MC" (list (- x-pnt-ins 7.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***");номер по овш
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "ТУ 25-2408.0009-88"))
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 130) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "**");количество
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 tmp-99);количество
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
