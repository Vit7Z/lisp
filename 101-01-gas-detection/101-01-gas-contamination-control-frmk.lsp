;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-gas-contamination-control-frmk

( / adoc dcl-id list-01 list-02 list-03 list-04 list-901 list-902 str-01 str-02 str-03 str-04 type-list)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
);start undo

(setq str-01 nil
			str-02 nil
			str-03 nil
			str-04 nil
			list-01 (list "ФСТ-03М")
      list-901 nil
      list-902 nil
);setq

(tmp-strt-101-gs-frmk)

(if (< (setq dcl-id (load_dialog "dia-101-01-gas-contamination-control-frmk.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_gs_frmk" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")

(action_tile "txt-01"
  (strcat "(tmp-strt-101-gs-frmk)"
  );srcat
);action_tile

;(action_tile "txt-01"
;  (strcat "(txt-01-101-gs-frmk)"
;  );srcat
;);action_tile

;(action_tile "txt-02"
;  (strcat "(txt-02-101-gs-frmk)"
;  );srcat
;);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-gs-frmk)"
  );srcat
);action_tile

;(action_tile "txt-04"
;  (strcat "(tmp-4-read-file-101-gs-frmk)"
;  );srcat
;);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-gs-frmk)"
  				"(list-filling \"txt-01\" list-01)"
  				"(list-filling \"txt-02\" list-02)"
					"(list-filling \"txt-03\" list-03)"
					"(list-filling \"txt-04\" list-04)"
					"(set_tile \"txt-01\" \"0\")"
					"(set_tile \"txt-02\" \"0\")"
          "(set_tile \"txt-03\" \"0\")"
          "(set_tile \"txt-04\" \"0\")"
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

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
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
	(tmp-le-101-gs-frmk)
);if

(if (= type-list "spcf")
	(tmp-spcf-101-gs-frmk)
);if

(if (= type-list "lecgv")
	(tmp-lecgv-101-gs-frmk)
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-gs-frmk

( / )

(if (= nil str-01) 
	(setq str-01 "ФСТ-03М");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(cond
	((= str-01 "ФСТ-03М")
		(progn	
			;
			(txt-01-101-gs-frmk)
			(mode_tile "txt-03" 1)
		);progn
	); =
);cond

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-gs-frmk

( / file-name file-open path-file-open str-f)

(setq list-02 nil
			list-03 nil
			list-04 nil
			str-f 1
);setq

(if (= str-01 "ФСТ-03М")
	(progn
		(setq 
					list-02 (list "CO" "CH4" "С3Н8")
					list-04 (list "Газ ФАРМЭК")
					file-name "101-01-gas-frmk-fst-03m.txt"
		);setq
		(mode_tile "txt-03" 1)
	);progn
);if

(setq path-file-open (findfile file-name);открываем файл
      file-open (open path-file-open "r")
);setq

(while (/= str-f nil)
	(setq str-f (read-line file-open));читаем строку

	(if (/= str-f nil)
		(setq list-03 (vl-list* str-f list-03));setq
	);if
);while

(close file-open)

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-gs-frmk

()

;(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
;);setq
;
;
;
;(list-filling "txt-04" list-04)
;
;(set_tile "txt-04" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-gs-frmk

( / cntr-2 str-02 str-02-901 str-04 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq swtch list-901 ;запоминаем первоначальное состояние списка в поле "выбрано"
			cntr-2 0 ;счетчик для обработки списка
			str-02-901 ""; строка для показания списка газов в поле 901
);setq

(if (/= swtch nil)	;если есть уже выбраннное то переворачиваем
	(setq list-902 (reverse list-902)
	);setq
);if

(if (= str-01 "ФСТ-03М")
	(progn
		(setq str-02 (get_tile "txt-02")
					str-02-901 str-02
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
		);setq

		(repeat (strlen str-02)
			(setq str-02-901 (vl-string-subst "CO (монооксид углерода)" "0" str-02-901)
						str-02-901 (vl-string-subst "CH4 (метан)" "1" str-02-901)
						str-02-901 (vl-string-subst "С3Н8 (пропан)" "2" str-02-901)
  		);setq
			(setq cntr-2 (1+ cntr-2));setq
		);repeat

  	(setq list-901 (vl-list* (strcat str-01 "  Контролируемые газы  " str-02-901) list-901));setq
		(setq tmp-list-902 (list (cons 1 str-01) ;модель
														 (cons 2 str-02) ;список номеров контролируемых газов
														 (cons 4 str-04) ;производитель
														 (cons 5 "2")    ;масса блока сигнализации и питания
														 (cons 6 "0,3")  ;масса блока датчика
											 );list
					list-902 (vl-list*  tmp-list-902 list-902)
		);setq
	);progn	
);if =

(if (= swtch nil)
	(setq list-902 (reverse list-902));setq
);if

(if (/= swtch nil)
	(setq list-902 (reverse list-902));setq
);if

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-gs-frmk

( / cntr-1 cntr-2 dlt-y nmbr-ln nmbr-ln-1 pnt-ins str-le-11 str-le-12 str-tmp str-tmp-1 str-tmp-2 str-tmp-4 tmp-str-02 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-le-11 nil
				str-le-12 nil
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

	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-1 "ФСТ-03М")
		(progn
			(setq str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
      			nmbr-ln 3  ;счетчик строк ПЭ
      			nmbr-ln-1 1 ;счетчик линий текста
      			cntr-2 0 ;счетчик для обработки списка
			);setq

			(setq str-tmp-2 (strcat "(" str-tmp-2 ")");преобразуем строку в список
      			str-tmp-2 (read str-tmp-2)
			);setq
								
			(repeat (length str-tmp-2)
				(setq tmp-str-02 (nth (nth cntr-2 str-tmp-2) list-02);извлекаем элемент из списка элементов по номеру в другом списке
  			);setq
  			
  			(setq tmp-str-02
  				(cond
						((= tmp-str-02 "CO") "- Блок датчика, измерение концентрации CO (монооксид углерода)")
						((= tmp-str-02 "CH4") "- Блок датчика, измерение концентрации CH4 (метан)")
						((= tmp-str-02 "С3Н8") "- Блок датчика, измерение концентрации С3Н8 (пропан)")
  				);cond
  			);setq
  			
  			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 tmp-str-02)
  			(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "***") ;количество
  			
  			(setq cntr-2 (1+ cntr-2);счетчик
  						nmbr-ln (1+ nmbr-ln)
  						nmbr-ln-1 (1+ nmbr-ln-1)
	  		);setq
			);repeat
		
			(setq str-le-11 (strcat "Газоанализатор " str-tmp-1 " в составе:")
						str-le-12 (strcat "- Блок питания и сигнализации")
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-le-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 str-le-12)
			(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "1") ;количество
		);progn	
	);if =
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	(setq cntr-1 (1+ cntr-1);счетчик
	);setq
	
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-gs-frmk

( / cntr-1 cntr-2 dlt-y dt-spcf-11 dt-spcf-12 dt-spcf-21 dt-spcf-81 dt-spcf-82 nmbr-ln nmbr-ln-1 pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-4 str-tmp-5 str-tmp-6 
tmp-str-02 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
			nmbr-ln nil ;счетчик строк спецификации
			nmbr-ln-1 nil ;счетчик для строк текста
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
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
	
  ;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-1 "ФСТ-03М")
		(progn
			(setq str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
						str-tmp-6 (cdr (assoc 6 str-tmp))
      			nmbr-ln 3  ;счетчик строк ПЭ
      			nmbr-ln-1 1 ;счетчик линий текста
      			cntr-2 0 ;счетчик для обработки списка
			);setq
			
			(setq str-tmp-2 (strcat "(" str-tmp-2 ")");преобразуем строку в список
      			str-tmp-2 (read str-tmp-2)
			);setq
					
			(repeat (length str-tmp-2)
				(setq tmp-str-02 (nth (nth cntr-2 str-tmp-2) list-02);извлекаем элемент из списка элементов по номеру в другом списке
  			);setq
  			
  			(setq tmp-str-02
  				(cond
						((= tmp-str-02 "CO") "- Блок датчика, измерение концентрации CO (монооксид углерода)")
						((= tmp-str-02 "CH4") "- Блок датчика, измерение концентрации CH4 (метан)")
						((= tmp-str-02 "С3Н8") "- Блок датчика, измерение концентрации С3Н8 (пропан)")
  				);cond
  			);setq
  			
  			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 tmp-str-02)
  			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "шт.")
  			(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "***") ;количество
  			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 str-tmp-6) ;масса блока датчика
  			
  			(setq cntr-2 (1+ cntr-2);счетчик
  						nmbr-ln (1+ nmbr-ln)
  						nmbr-ln-1 (1+ nmbr-ln-1)
	  		);setq
			);repeat
		
			(setq dt-spcf-21 (strcat str-tmp-1)
						;
						dt-spcf-81 (strcat "№ 22426-11")
						dt-spcf-82 (strcat "в Госреестре СИ")
;						dt-spcf-83 (strcat "свидетельство")
;						dt-spcf-84 (strcat "BY.C.31.999.A")
;						dt-spcf-85 (strcat "43901")
			);setq
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Газоанализатор в составе:")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "- Блок питания и сигнализации")
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat dt-spcf-21)) ;Тип, марка, обозначение документа, опросного листа
		
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"Газ ФАРМЭК\",")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "компл.")
			(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "1") ;количество
			(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "1")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 str-tmp-5) ;масса блока питания и сигнализации
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 dt-spcf-81) ;сертификаты
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 dt-spcf-82)
;			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 dt-spcf-83)
;			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 dt-spcf-84)
;			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 dt-spcf-85)
		);progn
	);if =
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






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
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-gs-frmk

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-13 str-tmp-14 str-tmp-15 str-tmp-16 str-tmp-2 str-tmp-2-1 str-tmp-2-2 str-tmp-3 
str-tmp-3-1 str-tmp-3-2 str-tmp-4 str-tmp-5 str-tmp-5-1 str-tmp-5-2 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	); setq
	(09-empt-lin-le-cgv)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;обработка данных	
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-1 "ФСТ-03М")
		(progn
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок сигнализации и питания из")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "состава газосигнализатора ФСТ-03М,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "производство ООО \"Газ ФАРМЭК\"")
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "3")
		
			(repeat 4
  			(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  				(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
			);repeat
		
			(command "_text" "_MC" (list (- x-pnt-ins 7.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***");номер по овш
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "*******");поз по пэ
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 130) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "**");количество
		);progn
	);if =
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	




 
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////