;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-sleeve-prtct-termiko

( / adoc dcl-id list-01 list-11 list-12 list-13 list-14 list-15 list-16 list-17 list-901 list-902 num-lin str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq num-lin 17 ;количество строк
			list-01 (list "Термико")
			list-11 nil
			list-12 nil
			list-13 nil
			list-14 nil
			list-15 nil
			list-16 nil
			list-17 nil
			list-901 nil
			list-902 nil
			str-01 nil
);setq

(tmp-strt-101-sleeve-prtct-termiko)

(if (< (setq dcl-id (load_dialog "dia-101-08-sleeve-prtct-termiko.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_sleeve_prtct_termiko" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)
(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)

(set_tile "txt-01" "0")
(set_tile "txt-11" "0")
(set_tile "txt-12" "0")
(set_tile "txt-13" "0")
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")
(set_tile "txt-17" "0")

(action_tile "txt-01"
  (strcat "(tmp-strt-101-sleeve-prtct-termiko)"
  );srcat
);action_tile

(action_tile "txt-11"
  (strcat "(txt-11-101-sleeve-prtct-termiko)"
  );srcat
);action_tile

(action_tile "txt-13"
  (strcat "(txt-13-101-sleeve-prtct-termiko)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-sleeve-prtct-termiko)"
  );strcat
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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond 
	((= type-list "le") (le-101-sleeve-prtct-termiko));=
	((= type-list "spcf") (spcf-101-sleeve-prtct-termiko));=
);cond
(gc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-sleeve-prtct-termiko

( / str-01)

(if (= nil str-01) 
	(setq str-01 "Термико"
	);setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
	);setq
);if
(if (= "Термико" str-01)
	(progn
		(setq list-11 (list "6,3" "25" "50")
      		list-12 (list "8" "10")
      		list-13 (list "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000")
      		list-14 (list "40" "40" "40" "40" "25" "25" "25" "5" "5" "5" "5" "5")
      		list-15 (list "4" "4" "4" "4" "2,5" "2,5" "2,5" "0,5" "0,5" "0,5" "0,5" "0,5")
      		list-16 (list "М20х1,5")
      		list-17 (list "Нет" "Да")
		);setq
	);progn
);if

(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)
(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)

(set_tile "txt-11" "0")
(set_tile "txt-12" "0")
(set_tile "txt-13" "0")
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")
(set_tile "txt-17" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-11-101-sleeve-prtct-termiko
( / pressure)

(setq pressure (nth (atoi (get_tile "txt-11")) list-11)
);setq

(if (= "6,3" pressure)
  (setq list-13 (list "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000")
        list-14 (list "40" "40" "40" "40" "25" "25" "25" "5" "5" "5" "5" "5")
        list-15 (list "4" "4" "4" "4" "2,5" "2,5" "2,5" "0,5" "0,5" "0,5" "0,5" "0,5")
        list-16 (list "М20х1,5")
  );setq
);if

(if (= "25" pressure)
  (setq list-13 (list "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600" "2000")
        list-14 (list "40" "40" "40" "40" "25" "25" "25" "5" "5" "5" "5" "5" "2" "2" "2")
        list-15 (list "4" "4" "4" "4" "2,5" "2,5" "2,5" "0,5" "0,5" "0,5" "0,5" "0,5" "0,2" "0,2" "0,2")
        list-16 (list "М20х1,5")
  );setq
);if

(if (= "50" pressure)
  (setq list-13 (list "120" "160" "200" "250" "320")
        list-14 (list "120" "120" "100" "100" "100" "100")
        list-15 (list "10" "10" "7,5" "7,5" "7,5")
        list-16 (list "М33х2")
  );setq
);if

(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)

(set_tile "txt-13" "0")
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")

(princ)
)
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-13-101-sleeve-prtct-termiko

( / str-13)

(set_tile "txt-14" (get_tile "txt-13"))
(set_tile "txt-15" (get_tile "txt-13"))
(set_tile "txt-16" (get_tile "txt-13"))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-sleeve-prtct-termiko

( / cntr-1 str-11 str-12 str-13 str-14 str-15 str-16 str-17 str-902 str-99 swtch)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-11 (nth (atoi (get_tile "txt-11")) list-11)
			str-12 (nth (atoi (get_tile "txt-12")) list-12)
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
			str-15 (nth (atoi (get_tile "txt-15")) list-15)
			str-16 (nth (atoi (get_tile "txt-16")) list-16)
			str-17 (nth (atoi (get_tile "txt-17")) list-17)
      swtch list-901 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq

(if (/= swtch nil);если есть уже выбраннное то переворачиваем
	(setq list-902 (reverse list-902);список характеристик для спецификации
	);setq
);if

(setq str-99 ;масса
	(cond	
		((= str-01 "Термико") "0,65")
	);cond
);setq

(if (= str-01 "Термико")
	(setq str-902 (list (cons 1 str-01) (cons 2 str-11) (cons 3 str-12) (cons 4 str-13) (cons 5 str-16) (cons 6 str-17) (cons 99 str-99))
  			list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
  			list-901 (vl-list* (strcat "Гильза защитная " str-11 "МПа  Диаметр монтажн. части " str-12 "мм.  Длина монтажн. части " str-13 "мм.  Термико") list-901)
	);setq
);if

(if (= swtch nil)
	(setq list-902 (reverse list-902);список характеристик для спецификации
	);setq
);if

(if (/= swtch nil)
	(setq list-902 (reverse list-902);список характеристик для спецификации
	);setq
);if

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-sleeve-prtct-termiko

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-11 str-tmp-2 str-tmp-3 str-tmp-4 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-11 nil
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 				y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8
	); setq
	(100-empt-lin-le)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(if (= "Термико" str-tmp-1)
		(progn
				(setq nmbr-ln 2 ;количество строк
							str-tmp-11 (strcat "Гильза защитная \"Термико\" ГЗ-" str-tmp-2 "-" str-tmp-3 "-" str-tmp-4)
				);setq
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
		);progn
	);if
  
	(setq cntr-1 (1+ cntr-1);счетчик
	);setq
	
	(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
	
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-sleeve-prtct-termiko

( / cntr-1 dlt-y dt-1-01 dt-1-02 dt-1-03 dt-1-04 dt-1-05 dt-1-06 dt-2-01 nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 
str-tmp-6 str-tmp-7 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(setvar "textstyle" "Standard")

(setq str-tmp-1 nil
			str-tmp-2 nil
			str-tmp-3 nil
			str-tmp-4 nil
			str-tmp-5 nil
			str-tmp-6 nil
			str-tmp-7 nil
			str-tmp-99 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-99 (cdr (assoc 99 str-tmp))
	);setq
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	); setq
	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

		
	;обработка данных
	(if (= "Термико" str-tmp-1)
		(progn			
			(setq nmbr-ln 7
				dt-1-01 (strcat "Гильза защитная")			
				dt-1-02 (strcat "- давление " str-tmp-2 "МПа")
				dt-1-03 (strcat "- под термопреобразователь с диаметром монтажной части " str-tmp-3 "мм.")
				dt-1-04 (strcat "- длина монтажной части " str-tmp-4 "мм.")
				dt-1-05 (strcat "- присоединительная резьба " str-tmp-5)
				dt-1-06 (strcat "- под присоединительный штуцер " (strcase str-tmp-6 1))
;				;
				dt-2-01 (strcat "ГЗ-" str-tmp-2 "-" str-tmp-3 "-" str-tmp-4)
			);setq
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 dt-1-01)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 dt-1-02)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 dt-1-03)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 dt-1-04)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 dt-1-05)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 dt-1-06)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 dt-2-01) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ЗАО \"Термико\",")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва, Зеленоград")
		);progn
	);iа
	
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99);масса
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")		
			
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
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
