;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                                   /////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-01-flwmtr-vzljot-er

( / adoc dcl-id list-01 list-02 list-03 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
      list-01 (list "ЭРСВ-420 ФВ (индикатор, фланцевое)")

      list-901 nil
      list-902 nil
);setq

(txt-01-101-01-flwmtr-vzljot-er)

(if (< (setq dcl-id (load_dialog "dia-101-01-flwmtr-vzljot-er.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_dia_101_01_flwmtr_vzljot_er" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-99" "0")


(action_tile "txt-01" 
  (strcat "(txt-01-101-01-flwmtr-vzljot-er)");strcat
);action_tile

(action_tile "txt-02" 
  (strcat "(setq str-01 (get_tile \"txt-02\"))"
  				"(set_tile \"txt-03\" str-01)"
  				"(set_tile \"txt-99\" str-01)"
  );srcat
);action_tile

(action_tile "txt-03" 
  (strcat "(setq str-01 (get_tile \"txt-03\"))"
  				"(set_tile \"txt-02\" str-01)"
  				"(set_tile \"txt-99\" str-01)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(filling-fields-101-01-flwmtr-vzljot-er)");strcat
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

(if (= type-list "le") (le-101-01-flwmtr-vzljot-er));if
(if (= type-list "spcf") (spcf-101-01-flwmtr-vzljot-er));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-flwmtr-vzljot-er

( / file-name-1 list-01-read-file list-02-read-file list-03-read-file num-flds-1)

(cond
	((= nil str-01) (setq str-01 (nth 0 list-01)));=
	((/= nil str-01) (setq str-01 (nth (atoi (get_tile "txt-01")) list-01)));=
);cond


(if (= str-01 "ЭРСВ-420 ФВ (индикатор, фланцевое)")	
	(setq file-name-1 "101-01-flwmtr-vzljot-er-ersv-420-fb.txt"
				num-flds-1 3
	);setq
); =

;считываем данные выключателей
(read-file-for-dialog-box file-name-1 num-flds-1)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-99 list-03-read-file
);setq


(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-99" list-99)


(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-99" "0")


(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-01-flwmtr-vzljot-er

( / str-01 str-02 str-03 str-99 swtch tmp-list-902)

(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

;считываем значения из полей диалога
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(setq list-901 (vl-list* (strcat str-01 "  Ду " str-02 " мм  Q=" str-03 "м3/ч") list-901));setq
		
(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99));list
			list-902 (vl-list*  tmp-list-902 list-902)
);setq

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-flwmtr-vzljot-er

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 tmp))
				str-02 (cdr (assoc 2 tmp))
				str-03 (cdr (assoc 3 tmp))
				
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 				y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8
	);setq
	
	(100-empt-lin-le)	
	
	;///////////////////////////////////////////////////////////////////
	(if (= str-01 "ЭРСВ-420 ФВ (индикатор, фланцевое)")
		(progn	
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Расходомер-счетчик электромагнитный ВЗЛЕТ ЭР, исполнение")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "ЭРСВ-420 ФВ, с индикатором, фланцевый, Ду " str-02 "мм,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "пределы изм. " str-03 "м3/ч"))
		);progn
	);if
	


	
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-flwmtr-vzljot-er

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-99 tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 tmp))
				str-02 (cdr (assoc 2 tmp))
				str-03 (cdr (assoc 3 tmp))
				str-99 (cdr (assoc 99 tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ЭРСВ-420 ФВ (индикатор, фланцевое)")
		(progn	
			(setq nmbr-ln 4);setq
	
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
		
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Расходомер-счетчик электромагнитный");наименование
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- с индикатором, фланцевый")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- Ду " str-02 "мм, пределы изм. " str-03 "м3/ч"))
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "ЭРСВ-420 ФВ, Ду " str-02 "мм,"))
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "***ОЛ.**"))
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.");количество
			;масса
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-99)
		
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ЗАО \"ВЗЛЕТ\",");производитель
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Санкт-Петербург")

			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "№39735-14 в")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Госреестре СИ РФ")

			(repeat nmbr-ln
				(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
				(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
			);repeat
		);progn
	);if

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
