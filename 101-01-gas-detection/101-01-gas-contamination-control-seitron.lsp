;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-gas-contamination-control-seitron

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
			list-01 (list "Монооксид углерода (СО)" 
										"Метан (СH4)")
			
      list-901 nil
      list-902 nil
);setq

(txt-01-101-01-gas-contamination-control-seitron)

(if (< (setq dcl-id (load_dialog "dia-101-01-gas-contamination-control-seitron.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл") 
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_gas_contamination_control_seitron" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-01-gas-contamination-control-seitron)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-01-101-01-gas-contamination-control-seitron)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-03 (get_tile \"txt-03\"))"
  				"(list-filling \"txt-04\" list-04)"
  				"(set_tile \"txt-04\" str-03)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-gas-contamination-control-seitron)"
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

(cond
	((= type-list "le") (le-101-01-gas-contamination-control-seitron));=
	((= type-list "spcf") (spcf-101-01-gas-contamination-control-seitron));=
	((= type-list "lecgv") (lecgv-101-01-gas-contamination-control-seitron));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-gas-contamination-control-seitron

( / list-01-read-file)

(cond
	((= nil str-01) (setq str-01 (nth 0 list-01)));=
	((/= nil str-01) (setq str-01 (nth (atoi (get_tile "txt-01")) list-01)));=
);cond

(if (= str-01 "Монооксид углерода (СО)") 
	(progn
		(setq list-02 (list "RGD COO MP1")
					list-05 (list "0,5")
		);seq
		(read-file-for-dialog-box "101-01-gas-seitron-rgd-coo-mp1.txt" 1)
		(setq list-06 list-01-read-file);setq
	);progn
);cond


(if (= str-01 "Метан (СH4)") 
	(progn
		(setq list-02 (list "RGD MET MP1")
					list-05 (list "0,3")
		);seq
		(read-file-for-dialog-box "101-01-gas-seitron-rgd-met-mp1.txt" 1)
		(setq list-06 list-01-read-file
		);setq
	);progn
);cond







(list-filling "txt-02" list-02)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-05" "0")
(set_tile "txt-02" "0")

;(txt-02-101-01-gas-contamination-control-seitron)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;; txt-01 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-01-gas-contamination-control-seitron

( / file-name file-open path-file-open str-00 str-01 str-02 str-f str-lft-03 str-lft-04)

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
			str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-f 1
			str-lft-03 nil
			str-lft-04 nil
);setq



(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-gas-contamination-control-seitron

( / cntr-1 str-01 str-02 str-05 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
      swtch list-901
      cntr-1 0
);setq


(if (/= swtch nil) (setq list-902 (reverse list-902)));if


(if (= str-01 "Монооксид углерода (СО)")
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
		);setq

		(cond 
			((= str-02 "RGD COO MP1")
				(setq list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
							tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-05))
							list-902 (vl-list* tmp-list-902 list-902)				
				);setq
			);=


		);cond
	);progn
);if
		

(if (= str-01 "Метан (СH4)")
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
		);setq

		(cond 
			((= str-02 "RGD MET MP1")
				(setq list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
							tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-05))
							list-902 (vl-list* tmp-list-902 list-902)				
				);setq
			);=


		);cond
	);progn
);if










(setq list-902 (reverse list-902))

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-gas-contamination-control-seitron

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-02 (cdr (assoc 2 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 				y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8
	);setq
	
	(100-empt-lin-le)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(setq nmbr-ln 3);setq
			
	(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-02 "RGD COO MP1")
		(progn
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор загазованности Seitron RGD COO MP1,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "контроль концентрации монооксида углерода (СО)"))
		);progn
	);if
  
  
  ;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-02 "RGD MET MP1")
		(progn
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Сигнализатор загазованности Seitron RGD MET MP1,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "контроль концентрации природного газа (CH4)"))
		);progn
	);if
  
  
	(setq cntr-1 (1+ cntr-1));setq
		
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-gas-contamination-control-seitron

( / cntr-1 dlt-y nmbr-ln pnt-ins str-02 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-02 (cdr (assoc 2 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)


	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-02 "RGD COO MP1")
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)	
			(setvar "cmdecho" 0)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Сигнализатор загазованности")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- контроль концентрации монооксида углерода (СО)")
		
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Seitron RGD COO MP1") ;Тип, марка, обозначение документа, опросного листа
		);progn
	);if
  
  
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-02 "RGD MET MP1")
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)	
			(setvar "cmdecho" 0)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Сигнализатор загазованности")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- контроль концентрации природного газа (CH4)")
		
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Seitron RGD MET MP1") ;Тип, марка, обозначение документа, опросного листа
		);progn
	);if








	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"Компания КИПА\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-01-gas-contamination-control-seitron

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq



(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////