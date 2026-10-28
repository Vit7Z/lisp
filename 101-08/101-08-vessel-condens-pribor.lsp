;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-08-vessel-condens-pribor

( / adoc dcl-id list-10 list-101 list-11 list-12 list-13 list-spcf num-lin type-list)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
);start undo

(setq num-lin 17 ;количество строк
			list-10 (list "Сосуд уравнительный СУ" "Сосуд разделительный СР" "Сосуд уравнительный конденсационный СК")
      list-11 (list "6,3" "25" "40")
      list-12 (list "2" "4")
      list-13 (list "Сталь 20" "Сталь 12Х18Н10Т")
      list-101 nil
      list-spcf nil
);setq

(if (< (setq dcl-id (load_dialog "dia-101-08-vessel-condens-pribor.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_vessel_condens_pribor" dcl-id))
		(exit)
);if

(list-filling "txt-10" list-10)
(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)
(list-filling "txt-13" list-13)

(set_tile "txt-10" "0")
(set_tile "txt-11" "0")
(set_tile "txt-12" "0")
(set_tile "txt-13" "0")

(action_tile "txt-10" ;выбор
  (strcat "(tmp-1-101-08-vessel-condens-pribor)"
  );strcat
);action_tile


(action_tile "txt-11" ;выбор
  (strcat "(tmp-2-101-08-vessel-condens-pribor)"
  );strcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-3-101-08-vessel-condens-pribor)"
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

(if (= type-list "le")
	(tmp-le-101-08-vessel-condens-pribor)
);if

(if (= type-list "spcf")
	(tmp-spcf-101-08-vessel-condens-pribor)
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-1-101-08-vessel-condens-pribor
( / pressure)

(setq pressure (nth (atoi (get_tile "txt-10")) list-10)
);setq

(if (= "Сосуд уравнительный СУ" pressure)
  (setq list-11 (list "6,3" "25" "40")
      	list-12 (list "2" "4")
      	list-13 (list "Сталь 20" "Сталь 12Х18Н10Т")
  );setq
);if

(if (= "Сосуд разделительный СР" pressure)
  (setq list-11 (list "6,3" "25" "40")
      	list-12 (list "2" "4")
      	list-13 (list "Сталь 20" "Сталь 12Х18Н10Т")
  );setq
);if

(if (= "Сосуд уравнительный конденсационный СК" pressure)
  (setq list-11 (list "4" "10" "40")
      	list-12 (list "1")
      	list-13 (list "Сталь 20" "Сталь 12Х18Н10Т")
  );setq
);if

(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)
(list-filling "txt-13" list-13)

(set_tile "txt-11" "0")
(set_tile "txt-12" "0")
(set_tile "txt-13" "0")

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-2-101-08-vessel-condens-pribor
( / str-11)

(setq str-11 (nth (atoi (get_tile "txt-11")) list-11)
);setq

(if (= "4" str-11)
  (setq list-12 (list "1")
  );setq
);if

(if (= "6,3" str-11)
  (setq list-12 (list "2" "4")
  );setq
);if

(if (= "25" str-11)
  (setq list-12 (list "2" "4")
  );setq
);if

(if (= "40" str-11)
  (setq list-12 (list "Без исполнен.")
  );setq
);if

(list-filling "txt-12" list-12)

(set_tile "txt-12" "0")

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun tmp-3-101-08-vessel-condens-pribor

( / cntr-1 str-10 str-10-1 str-10-2 str-11 str-11-1 str-12 str-12-1 str-13 str-13-1 swtch tmp-str-spcf)

;заполняем поле "выбрано"
(setq str-10 (nth (atoi (get_tile "txt-10")) list-10)
			str-11 (nth (atoi (get_tile "txt-11")) list-11)
			str-12 (nth (atoi (get_tile "txt-12")) list-12)
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
      swtch list-101 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq

(if (/= swtch nil);если есть уже выбраннное то переворачиваем
	(setq list-spcf (reverse list-spcf);список характеристик для спецификации
	);setq
);if

(cond
	((= str-10 "Сосуд уравнительный СУ")
		(progn
			(setq str-10-1 "Сосуд СУ"
						str-10 "Сосуд уравнительный"
			); setq
		);progn
	); =
	
	((= str-10 "Сосуд разделительный СР")
		(progn
			(setq str-10-1 "Сосуд СР"
						str-10 "Сосуд разделительный"
			); setq
		);progn
	); =
	
	((= str-10 "Сосуд уравнительный конденсационный СК")
		(progn
			(setq str-10-1 "Сосуд СК"
						str-10 "Сосуд уравнительный конденсационный"
			); setq
		);progn
	); =
); cond

(setq str-11-1 (strcat str-11 "МПа")
);setq

(if (= str-12 "Без исполнен.") 
  (setq str-12-1 "Без исполнен."
  );setq
  (setq str-12-1 (strcat "Исп. " str-12)
  );setq
);if

(if (= str-13 "Сталь 20")  
  	(setq str-13-1 "сталь 20"
  				str-13 "А"
  	);setq
);if

(if (= str-13 "Сталь 12Х18Н10Т")
 	(setq str-13-1 "сталь 12Х18Н10Т"
 				str-13 "Б"
 	);setq
);if

;список для заполнения поля "выбрано"
(setq list-101 (vl-list* (strcat str-10-1 " " str-11-1 " " str-12-1 " " str-13-1) list-101)
);setq
(list-filling "txt-101" (reverse list-101))

;//////////////////////////////////////////////////
(if (/= str-12 "Без исполнен.") 
  (setq str-10-2 (strcat str-10-1 " " str-11 " " str-12 " " str-13)
  );setq
  (setq str-10-2 (strcat str-10-1 " " str-11 " " str-13)
  );setq
);if

;список для обработки
(setq tmp-str-spcf (list (cons 0 str-10)  (cons 1 str-10-2) (cons 2 str-11) (cons 3 str-12) (cons 4 str-13-1))
  		list-spcf (vl-list*  tmp-str-spcf list-spcf);список для спецификации
);setq

(if (= swtch nil)
	(setq list-spcf (reverse list-spcf);список характеристик для спецификации
	);setq
);if

(if (/= swtch nil)
	(setq list-spcf (reverse list-spcf);список характеристик для спецификации
	);setq
);if

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ////////////////////////////////////////////////////////////////////
(defun tmp-le-101-08-vessel-condens-pribor

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-13 str-tmp-2 str-tmp-3 str-tmp-4 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-spcf)
	(setq str-tmp (nth cntr-1 list-spcf)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
	);setq
	
	(setq str-tmp-1 (substr str-tmp-1 (+ (vl-string-search " " str-tmp-1) 2))
				str-tmp-1 (vl-string-left-trim " " str-tmp-1)
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	  		nmbr-ln 3 ;количество строк
	); setq
	(100-empt-lin-le)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
		
	(if (/= str-tmp-0 "Сосуд уравнительный конденсационный")
		(if (/= str-tmp-3 "Без исполнен.")
  		(setq str-tmp-11 (strcat str-tmp-0 " " str-tmp-1 ", давление условное " str-tmp-2 "МПа,")
  					str-tmp-12 (strcat "исполнение " str-tmp-3 ", материал " str-tmp-4)
  		);setq
  	);if
	);if
	
	(if (/= str-tmp-0 "Сосуд уравнительный конденсационный")
		(if (= str-tmp-3 "Без исполнен.")
  		(setq str-tmp-11 (strcat str-tmp-0 " " str-tmp-1 ", давление условное " str-tmp-2 "МПа,")
  					str-tmp-12 (strcat "исполнение не указывается, материал " str-tmp-4)
  		);setq
  	);if
	);if
	
	(if (= str-tmp-0 "Сосуд уравнительный конденсационный")
		(if (/= str-tmp-3 "Без исполнен.")
			(progn
  			(setq str-tmp-11 (strcat str-tmp-0 " " str-tmp-1 ",")
  						str-tmp-12 (strcat "давление условное " str-tmp-2 "МПа, исполнение " str-tmp-3 ",")
  						str-tmp-13 (strcat "материал " str-tmp-4)
  						nmbr-ln 4 ;количество строк
  			);setq
  			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
  		);progn
  	);if
	);if

	(if (= str-tmp-0 "Сосуд уравнительный конденсационный")
		(if (= str-tmp-3 "Без исполнен.")
			(progn
  			(setq str-tmp-11 (strcat str-tmp-0 " " str-tmp-1 ",")
  						str-tmp-12 (strcat "давление условное " str-tmp-2 "МПа, исполнение не указывается,")
  						str-tmp-13 (strcat "материал " str-tmp-4)
  						nmbr-ln 4 ;количество строк
  			);setq
  			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
  		);progn
  	);if
	);if

	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)

	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
	
	(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
 
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-08-vessel-condens-pribor

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-13 str-tmp-2 str-tmp-3 str-tmp-4 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-spcf)
	(setq str-tmp (nth cntr-1 list-spcf)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
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
	
	(setq str-tmp-11 (strcat "- давление условное " str-tmp-2 "МПа")
				str-tmp-12 (strcat "- материал сосуда " str-tmp-4)
	);setq
	
	(if (/= str-tmp-3 "Без исполнен.")
		(progn
			(setq str-tmp-13 (strcat "- исполнение " str-tmp-3)
						nmbr-ln 5
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-0)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-11))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-12))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-13))
	
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1))
		);progn
	);if
		
	(if (= str-tmp-3 "Без исполнен.")
		(progn
			(setq nmbr-ln 4
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-0)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-11))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-12))
	
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1))
		);progn
	);if
	
	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
	
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ТУ 25-7439.0018-90")
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "ФГУП \"Завод \"Прибор\",");производитель
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 12)) 2.5 0 "г. Челябинск")
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "4")
 
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
