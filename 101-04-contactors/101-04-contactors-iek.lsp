;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-contactors-iek

( / adoc dcl-id file-name file-open list-00 list-01 list-02 list-03 list-04 list-05 list-06 list-901 list-902 path-file-open str-00 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-f 1;переменные
      str-00 nil
      list-00 (list "КМИ"
                    "Приставка контактная ПКИ"                    
                    )
      list-901 nil
      list-902 nil
      file-name nil
      file-open nil
      path-file-open nil
);setq

(txt-00-101-04-contactors-iek)

(if (< (setq dcl-id (load_dialog "dia-101-04-contactors-iek.dcl")) 0) ;ищем диалог
    (progn
      (alert "Не найден dcl-файл")
      (exit)
    );progn
);if

(if (not (new_dialog "dia_101_04_contactors_iek" dcl-id))
    (exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(action_tile "txt-00"
  (strcat "(txt-00-101-04-contactors-iek)");srcat
);action_tile

(action_tile "txt-01"
  (strcat "(txt-01-101-04-contactors-iek)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-04-contactors-iek)");srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-contactors-iek)");strcat
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
	((= type-list "le") (le-101-04-contactors-iek));=
	((= type-list "spcf") (spcf-101-04-contactors-iek));=
	((= type-list "lecgv") (lecgv-101-04-contactors-iek));=
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
(defun txt-00-101-04-contactors-iek

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file)

(if (= nil str-00) 
  (setq str-00 (nth 0 list-00));setq
  (setq str-00 (nth (atoi (get_tile "txt-00")) list-00));setq
);if

(cond
	((= str-00 "КМИ")
    (progn
      (set_tile "ptxt-021" "Iном.,")
      (set_tile "ptxt-022" "А")
      (set_tile "ptxt-031" "Uупр.,")
      (set_tile "ptxt-032" "В")    
      (set_tile "ptxt-041" "Доп.")
      (set_tile "ptxt-042" "контакты")
      (set_tile "ptxt-051" "Артикул")
      (set_tile "ptxt-052" "")
      (set_tile "ptxt-061" "Кол.")
      (set_tile "ptxt-062" "полюсов")
      (set_tile "ptxt-071" "Контакторы общего назначения.")
      
      (read-file-for-dialog-box "101-04-contactors-iek-kmi.txt" 6)
      
            
    );progn
  ); str-1
 
  ((= str-00 "Приставка контактная ПКИ")
    (progn
      (set_tile "ptxt-021" "Контакты")
      (set_tile "ptxt-022" "")      
      (set_tile "ptxt-031" "Монтаж на")
      (set_tile "ptxt-032" "контактор")
      (set_tile "ptxt-041" "Артикул")
      (set_tile "ptxt-042" "")
      (set_tile "ptxt-051" "")
      (set_tile "ptxt-052" "")
      (set_tile "ptxt-061" "")
      (set_tile "ptxt-062" "") 
      (set_tile "ptxt-071" "")
      
      (read-file-for-dialog-box "101-04-contactors-iek-kmi-add-pki.txt" 4)          
    );progn
  );str-1
);cond

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-05 list-05-read-file
			list-06 list-06-read-file
);setq

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
(set_tile "txt-06" "0")

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;; txt-01 ////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-contactors-iek

( / str-0 str-11)

(setq str-0 (nth (atoi (get_tile "txt-00")) list-00));setq

(if (= str-0 "КМИ")
  (progn
    (setq str-11 (get_tile "txt-01"));setq
    (set_tile "txt-02" str-11)
    (set_tile "txt-03" str-11)
    (set_tile "txt-04" str-11)
    (set_tile "txt-05" str-11)
    (set_tile "txt-06" str-11)
  );progn
);if

(if (= str-0 "Приставка контактная ПКИ")
  (progn
    (setq str-11 (get_tile "txt-01"));setq
    (set_tile "txt-02" str-11)
    (set_tile "txt-03" str-11)
    (set_tile "txt-04" str-11)
  );progn
);if


(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма для txt-03/////////////////////////////////////////////////////////////////////////
(defun txt-02-101-04-contactors-iek

( / str-0 str-11)

(setq str-0 (nth (atoi (get_tile "txt-00")) list-00));setq

(if (= str-0 "КМИ")
  (progn
    (setq str-11 (get_tile "txt-02"));setq
    (set_tile "txt-01" str-11)
    (set_tile "txt-03" str-11)
    (set_tile "txt-04" str-11)
    (set_tile "txt-05" str-11)
    (set_tile "txt-06" str-11)
  );progn
);if

(if (= str-0 "Приставка контактная ПКИ")
  (progn
    (setq str-11 (get_tile "txt-02"));setq
    (set_tile "txt-01" str-11)
    (set_tile "txt-03" str-11)
    (set_tile "txt-04" str-11)
  );progn
);if

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных////////////////////////////////////////////////////////////////
(defun but1-101-04-contactors-iek

( / cntr-1 str-00 swtch tmp-list-902 tmp-str-01 tmp-str-02 tmp-str-03 tmp-str-04 tmp-str-05 tmp-str-06)

;заполняем поле "выбрано"
(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-00 "КМИ")
  (progn
		(setq tmp-str-01 (nth (atoi (get_tile "txt-01")) list-01)
          tmp-str-02 (nth (atoi (get_tile "txt-02")) list-02)
          tmp-str-03 (nth (atoi (get_tile "txt-03")) list-03)
          tmp-str-04 (nth (atoi (get_tile "txt-04")) list-04)
          tmp-str-05 (nth (atoi (get_tile "txt-05")) list-05)
          tmp-str-06 (nth (atoi (get_tile "txt-06")) list-06)
     );setq

     (setq list-901 (vl-list* (strcat "Контактор "
     																	tmp-str-01 "  " 
                                      "Iном. " tmp-str-02 "А  " 
                                       tmp-str-03 "В  " 
                                       tmp-str-04 "  " 
                                      "Артикул " tmp-str-05 "  " 
                                      ) list-901)
     );setq
      
     (setq tmp-list-902 (list (cons 0 str-00) 
                              (cons 1 tmp-str-01) 
                              (cons 2 tmp-str-02) 
                              (cons 3 tmp-str-03) 
                              (cons 4 tmp-str-04) 
                              (cons 5 tmp-str-05) 
                              (cons 6 tmp-str-06)
                              (cons 99 "0,5"))
           list-902 (vl-list*  tmp-list-902 list-902)
     );setq
  );progn 
);if = str-00


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= str-00 "Приставка контактная ПКИ")
				(= str-00 "Доп. контакты LC1 D"))
  (progn
    (setq tmp-str-01 (nth (atoi (get_tile "txt-01")) list-01)
          tmp-str-02 (nth (atoi (get_tile "txt-02")) list-02)
          tmp-str-03 (nth (atoi (get_tile "txt-03")) list-03)
          tmp-str-04 (nth (atoi (get_tile "txt-04")) list-04)
    );setq

    (setq list-901 (vl-list* (strcat "Приставка контактная " 
                                     tmp-str-01 "  " 
                                     tmp-str-02 "  " 
                                     tmp-str-03 "  "
                                     "Артикул " tmp-str-04) list-901)
    );setq
      
    (setq tmp-list-902 (list (cons 0 str-00) 
                             (cons 1 tmp-str-01) 
                             (cons 2 tmp-str-02) 
                             (cons 3 tmp-str-03)
                             (cons 4 tmp-str-04)
                             (cons 99 "0,05"))
          list-902 (vl-list*  tmp-list-902 list-902)
    );setq
  );progn 
);if = str-00

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////

;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ///////////////////////////////////////////
(defun le-101-04-contactors-iek

( / cntr-1 pnt-ins str-701 str-702 str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-tmp-0 (cdr (assoc 0 str-tmp))
        str-tmp-1 (cdr (assoc 1 str-tmp))
        str-tmp-2 (cdr (assoc 2 str-tmp))
        str-tmp-3 (cdr (assoc 3 str-tmp))
        str-tmp-4 (cdr (assoc 4 str-tmp))
  );setq

  (setvar "osmode" 6199)
  
  (setq pnt-ins   (getpoint "\nУкажите точку вставки\n")); setq
  
  (100-empt-lin-le)

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "КМИ")
    (setq str-tmp-5 (cdr (assoc 5 str-tmp))      
      		str-701 (strcat "Контактор " str-tmp-1 ", артикул " str-tmp-5 ", Iном. " str-tmp-2 "А, Uупр. " str-tmp-3 "В, доп. контакты " str-tmp-4)
      		str-702 nil
    );setq
  );=

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "Приставка контактная ПКИ")
  	(progn  
    	(if (= str-tmp-3 "Спереди") (setq str-tmp-3 "спереди"));if
    	(setq str-701 (strcat "Приставка контактная " str-tmp-1 ", артикул " str-tmp-4 "," str-tmp-2 ", крепление на контактор " str-tmp-3)
    				str-702 nil
    	);
    );progn
  );=

	(split-str-parts-le-01-general str-701 str-702 pnt-ins);

  (setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-contactors-iek

( / cntr-1 dlt-y nmbr-ln pnt-ins str-not str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-99 str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-tmp-0 (cdr (assoc 0 str-tmp))
        str-tmp-1 (cdr (assoc 1 str-tmp))
        str-tmp-2 (cdr (assoc 2 str-tmp))
        str-tmp-3 (cdr (assoc 3 str-tmp))
        str-tmp-4 (cdr (assoc 4 str-tmp))
        str-tmp-5 (cdr (assoc 5 str-tmp))
        str-tmp-99 (cdr (assoc 99 str-tmp))
  );setq
  
  (setvar "osmode" 6199)
  
  (setq pnt-ins   (getpoint "\nУкажите точку вставки\n")
        x-pnt-ins (nth 0 pnt-ins)
        y-pnt-ins (nth 1 pnt-ins)
        y-pnt-ins-1 y-pnt-ins
        dlt-y 8
  );setq
  
  (101-empt-lin-spcf)
 
  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "КМИ")
    (progn
      (setq nmbr-ln 4);setq
      
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Контактор")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- Iном. " str-tmp-2 "А, Uупр. " str-tmp-3 "В"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- доп. контакт(ы) " str-tmp-4))
			
			(setq str-txt (strcat  str-tmp-1 ", артикул " str-tmp-5));setq
			
			(split-str-parts-spcf-60-02 str-txt str-not pnt-ins);
    );progn 
  );=

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "Приставка контактная ПКИ")
    (progn      
      (setq nmbr-ln 4);setq
      
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(if (= str-tmp-3 "Спереди") (setq str-tmp-3 "спереди"));if

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Приставка контактная (для контакторов типа КМИ)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- сочетане контактов " str-tmp-2 ", крепление на контактор " str-tmp-3))
			
			(setq str-txt (strcat  str-tmp-1 ", артикул " str-tmp-4));setq
			
			(split-str-parts-spcf-60-02 str-txt str-not pnt-ins);
    );progn 
  );=


  (repeat nmbr-ln
    (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
    (setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
  );repeat
                
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"ИНТЕР-")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ЭЛЕКТРОКОМПЛЕКТ\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Москва")
      
  (command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
  
  (command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)
 
  (setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-contactors-iek

( / cntr-1 dlt-y pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-99 str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-tmp-0 (cdr (assoc 0 str-tmp))
        str-tmp-1 (cdr (assoc 1 str-tmp))
        str-tmp-2 (cdr (assoc 2 str-tmp))
        str-tmp-3 (cdr (assoc 3 str-tmp))
        str-tmp-4 (cdr (assoc 4 str-tmp))
        str-tmp-99 (cdr (assoc 99 str-tmp))
  );setq

  (setvar "osmode" 6199)
  
  (setq pnt-ins   (getpoint "\nУкажите точку вставки\n")
        x-pnt-ins (nth 0 pnt-ins)
        y-pnt-ins (nth 1 pnt-ins)
        y-pnt-ins-1 y-pnt-ins
        dlt-y 8
  );setq
  
  (09-empt-lin-le-cgv)

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "КМИ")
    (setq str-tmp-5 (cdr (assoc 5 str-tmp))
 					str-txt (strcat "Контактор " str-tmp-1 ", артикул, " str-tmp-5 ", Iном. " str-tmp-2 "А, Uупр. " str-tmp-3 "В, доп. контакт(ы) " str-tmp-4)
 		);setq
  );if
	

	;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-0 "Приставка контактная ПКИ")
		(progn			
			(if (= str-tmp-3 "Спереди") (setq str-tmp-3 "спереди"));if
			
			(setq str-txt (strcat "Приставка контактная " str-tmp-1 ", артикул " str-tmp-4 ", крепление на контактор " str-tmp-3));setq
		);progn	
	);if

	(split-str-parts-lecgv-65-01 str-txt pnt-ins)

	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)
 
  (setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////