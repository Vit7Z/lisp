;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-socket-general

( / adoc dcl-id list-00 list-01 list-02 list-901 list-902 str-00 str-01 str-02 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-f 1;переменные
			str-00 nil
			str-01 nil
			str-02 nil
      list-00 (list "Розетка IEK"

      							)
      list-901 nil
      list-902 nil
);setq

(txt-01-101-04-other-socket)

(if (< (setq dcl-id (load_dialog "dia-101-04-socket-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_socket_general" dcl-id))
		(exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")

(action_tile "txt-00"
  (strcat "(txt-01-101-04-other-socket)");srcat
);action_tile

(action_tile "txt-01"
  (strcat "(txt-02-101-04-other-socket)");srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-04-other-socket)");strcat
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

(if (= type-list "le") (tmp-le-101-04-other-socket));if

(if (= type-list "spcf") (tmp-spcf-101-04-other-socket));if

(if (= type-list "lecgv") (tmp-lecgv-101-04-other-socket));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ///////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-other-socket

()

(if (= nil str-00) 
	(setq str-00 (nth 0 list-00));setq
	(setq str-00 (nth (atoi (get_tile "txt-00")) list-00));setq
);if

(setq list-01 nil
			list-02 nil
);setq



(if (= str-00 "Розетка IEK")
	(setq list-01 (list "РАр10-3-ОП")
				list-02 (list "Розетка с заземляющим контактом" "Монтаж на DIN-рейку" "Белый цвет" "Артикул MRD10-16")
	);setq
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)

(set_tile "txt-01" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-04-other-socket

( / tmp-902)

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(if (= str-00 "Розетка IEK")
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)	
  			list-901 (vl-list* (strcat str-00 " " str-01) list-901)
  	
				tmp-902 (list (cons 0 str-00) (cons 1 str-01))
	);setq
);if =

(setq list-902 (vl-list* tmp-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ///////////////////////////////////////////////////////////////
(defun tmp-le-101-04-other-socket

( / cntr-1 pnt-ins str-0 str-701 str-702 str-tmp)

(setq cntr-1 0
      str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(if (= str-0 "Розетка IEK")
		(setq str-701 "Розетка с заземляющим контактом IEK, РАр10-3-ОП, артикул MRD10-16");setq
	);if
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");	

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   /////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-other-socket

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-10 str-tmp-21 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)

	;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Розетка IEK" str-tmp-0)
		(progn
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Розетка с заземляющими контактами")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- монтаж на DIN-рейку")
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "РАр10-3-ОП,") ;Тип, марка, обозначение документа, опросного листа
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "артикул MRD10-16")
			
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,2")
			
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"ИНТЕР-")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ЭЛЕКТРОКОМПЛЕКТ\",")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Москва")
			
		);progn
	);if




	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               //////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-04-other-socket

( / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 0 str-tmp))
				str-02 (cdr (assoc 1 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;///////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Розетка IEK" str-01)
		(setq str-701 (strcat "Розетка с заземляющим контактом IEK, РАр10-3-ОП, артикул MRD10-16")		
					str-702 nil
					str-703 nil
					str-99 "0,2"
		);setq
	);if


	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////