;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-danfoss-fqs-u30g

( / adoc dcl-id file-name-1 file-name-2 list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-1001 list-901 list-902 num-flds-1 num-flds-2 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(setq list-901 nil
      list-902 nil
);setq

(setq file-name-1 "101-01-danfoss-fqs-u30g.txt"
			file-name-2 "101-01-danfoss-fqs-u30g-description.txt"
			num-flds-1 4
			num-flds-2 1
);setq

;считываем данные выключателей
(read-file-for-dialog-box file-name-1 num-flds-1)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
);setq


;считываем описание выключателей
(read-file-for-dialog-box file-name-2 num-flds-2)

(setq list-1001 list-01-read-file);setq

(if (< (setq dcl-id (load_dialog "dia-101-01-danfoss-fqs-u30g.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_danfoss_fqs_u30g" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)

(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")

(action_tile "txt-01" 
  (strcat "(setq str-txt (get_tile \"txt-01\"))"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  );strcat
);action_tile

(action_tile "txt-02" 
  (strcat "(setq str-txt (get_tile \"txt-02\"))"
  				"(set_tile \"txt-01\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  );strcat
);action_tile

(action_tile "txt-03" 
  (strcat "(setq str-txt (get_tile \"txt-03\"))"
  				"(set_tile \"txt-01\" str-txt)"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  );strcat
);action_tile

(action_tile "txt-04" 
  (strcat "(setq str-txt (get_tile \"txt-04\"))"
  				"(set_tile \"txt-01\" str-txt)"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  );strcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-danfoss-fqs-u30g)");srcat
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

(action_tile "but5"
  (strcat "(delete-item)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-01-danfoss-fqs-u30g));if

(if (= type-list "spcf") (spcf-101-01-danfoss-fqs-u30g));if

(if (= type-list "lecgv") (lecgv-101-01-danfoss-fqs-u30g));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-danfoss-fqs-u30g

( / str-01 str-02 str-03 str-04 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

;считываем значения из полей диалога
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
);setq

(setq list-901 (vl-list* (strcat "Диаметр " str-01 "  " 
																 "Диапазон увелич. " str-02 "м3/ч  "
																 "Диапазон уменьш. " str-03 "м3/ч  "
																 "Лепестки " str-04 " м  "
																 ) list-901)
);setq


(setq tmp-list-902 (list (cons 1 str-01)
												 (cons 2 str-02)
												 (cons 3 str-03)
												 (cons 4 str-04)
									 			 (cons 99 "0,6")
									 			 );list
			list-902 (vl-list*  tmp-list-902 list-902)
);setq

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-danfoss-fqs-u30g

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp tmp-01 tmp-02 tmp-03 tmp-04 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				tmp-01 (cdr (assoc 1 str-tmp))
				tmp-02 (cdr (assoc 2 str-tmp))
				tmp-03 (cdr (assoc 3 str-tmp))
				tmp-04 (cdr (assoc 4 str-tmp))
	);setq

;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 				y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8
	);setq
	
	(100-empt-lin-le)

	;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq nmbr-ln 4);setq
						
	(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)

	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Реле протока Danfoss FQS-U30G, диаметр трубопровода " tmp-01 "мм,"))
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "диапазон уменьшения расхода " tmp-02 "м3/ч,"))
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "диапазон увеличения расхода " tmp-03 "м3/ч"))

	(setq cntr-1 (1+ cntr-1));setq
		
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-danfoss-fqs-u30g

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
     
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
				nmbr-ln 6
	);setq

	(101-empt-lin-spcf)
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата

	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Реле протока")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- диаметр трубопровода " str-01 "мм"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- диапазон уменьшения расхода " str-02 "м3/ч"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- диапазон увеличения расхода " str-03 "м3/ч"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- набор лепестков " str-04))
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса
	;
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 "FQS-U30G, код заказа")
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 12)) 2.5 0 "061H4000")

	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Danfoss,")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "http://www.danfoss.com/")		
	;	
	(repeat nmbr-ln
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////