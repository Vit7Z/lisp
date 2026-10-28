;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-contactors-abb-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-08 list-09 list-1001 list-801 list-802 list-901 list-902 list-99 str-01 str-02 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      
			str-01 "0"
			str-02 nil
);setq

(read-file-for-dialog-box-01 "101-04-contactors-abb-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-04-contactors-abb-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-contactors-abb-01-general.dcl")) 0) ;ищем диалог
    (progn
      (alert "Не найден dcl-файл")
      (exit)
    );progn
);if

(if (not (new_dialog "dia_101_04_contactors_abb" dcl-id))
    (exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")

(action_tile "txt-01" 
	(strcat "(setq str-01 (get_tile \"txt-01\"))"
					"(txt-01-101-04-contactors-abb-01-general str-01)"
	);strcat
);action_tile

(action_tile "txt-02" 
	(strcat "(setq str-txt (get_tile \"txt-02\"))";setq
					"(set_tile \"txt-03\" str-txt)"
					"(set_tile \"txt-04\" str-txt)"
					"(set_tile \"txt-05\" str-txt)"
					"(set_tile \"txt-06\" str-txt)"
					"(set_tile \"txt-07\" str-txt)"
					"(set_tile \"txt-08\" str-txt)"
					"(set_tile \"txt-09\" str-txt)"
					"(set_tile \"txt-10\" str-txt)"
	);
);action_tile

(action_tile "txt-04" 
	(strcat "(setq str-txt (get_tile \"txt-04\"))";setq
					"(set_tile \"txt-02\" str-txt)"
					"(set_tile \"txt-03\" str-txt)"
					"(set_tile \"txt-05\" str-txt)"
					"(set_tile \"txt-06\" str-txt)"
					"(set_tile \"txt-07\" str-txt)"
					"(set_tile \"txt-08\" str-txt)"
					"(set_tile \"txt-09\" str-txt)"
					"(set_tile \"txt-10\" str-txt)"
	);
);action_tile

(action_tile "txt-05" 
	(strcat "(setq str-txt (get_tile \"txt-05\"))";setq
					"(set_tile \"txt-02\" str-txt)"
					"(set_tile \"txt-03\" str-txt)"
					"(set_tile \"txt-04\" str-txt)"
					"(set_tile \"txt-06\" str-txt)"
					"(set_tile \"txt-07\" str-txt)"
					"(set_tile \"txt-08\" str-txt)"
					"(set_tile \"txt-09\" str-txt)"
					"(set_tile \"txt-10\" str-txt)"
	);
);action_tile

(action_tile "txt-07" 
	(strcat "(setq str-txt (get_tile \"txt-07\"))";setq
					"(set_tile \"txt-02\" str-txt)"
					"(set_tile \"txt-03\" str-txt)"
					"(set_tile \"txt-04\" str-txt)"
					"(set_tile \"txt-05\" str-txt)"
					"(set_tile \"txt-06\" str-txt)"
					"(set_tile \"txt-08\" str-txt)"
					"(set_tile \"txt-09\" str-txt)"
					"(set_tile \"txt-10\" str-txt)"
	);
);action_tile

(action_tile "txt-03" (strcat "(txt-03-101-04-contactors-abb-01-general)")
);action_tile

(action_tile "but1" 
  (strcat "(but1-101-04-contactors-abb-01-general)");strcat
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
	((= type-list "le") (le-101-04-contactors-abb-01-general));=
	((= type-list "spcf") (spcf-101-04-contactors-abb-01-general));=
	((= type-list "lecgv") (lecgv-101-04-contactors-abb-01-general));=
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
(defun txt-01-101-04-contactors-abb-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-07-read-file list-08-read-file list-09-read-file 
list-900-dscr list-900-menu list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(set_tile "ptxt-41" (nth 0 list-900-menu))
(set_tile "ptxt-42" (nth 1 list-900-menu))

(set_tile "ptxt-51" (nth 2 list-900-menu))
(set_tile "ptxt-52" (nth 3 list-900-menu))

(set_tile "ptxt-61" (nth 4 list-900-menu))
(set_tile "ptxt-62" (nth 5 list-900-menu))

(set_tile "ptxt-71" (nth 6 list-900-menu))
(set_tile "ptxt-72" (nth 7 list-900-menu))

(set_tile "ptxt-81" (nth 8 list-900-menu))
(set_tile "ptxt-82" (nth 9 list-900-menu))

(set_tile "ptxt-91" (nth 10 list-900-menu))
(set_tile "ptxt-92" (nth 11 list-900-menu))

(set_tile "ptxt-101" (nth 12 list-900-menu))
(set_tile "ptxt-102" (nth 13 list-900-menu))

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
			list-08 list-07-read-file
			list-09 list-08-read-file
			list-10 list-09-read-file
);setq

(divide-text-into-parts list-900-dscr 170)

(setq list-900 list-900-read-file)

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-contactors-abb-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-99 tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
   		str-02 (nth (atoi (get_tile "txt-02")) list-02)
      str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(if (or (= str-01 "Контактор AF")
				(= str-01 "Контактор B6"));or
  (setq str-05 (nth (atoi (get_tile "txt-05")) list-05)
        str-06 (nth (atoi (get_tile "txt-06")) list-06)
        str-07 (nth (atoi (get_tile "txt-07")) list-07)
        str-08 (nth (atoi (get_tile "txt-08")) list-08)
        str-09 (nth (atoi (get_tile "txt-09")) list-09)
        str-99 (nth (atoi (get_tile "txt-10")) list-10)
    
      	list-901 (vl-list* (strcat "Контактор  " str-02 "  Iном. " str-05 "А  " str-06 "  " str-07 "  Uупр "  str-08) list-901)
      
      	tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)
                           (cons 8 str-08) (cons 9 str-09) (cons 99 str-99))
   );setq
);if


(if (or (= str-01 "Доп. контакты AF")
				(= str-01 "Доп. контакты B6"));or
  (setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
        str-05 (nth (atoi (get_tile "txt-05")) list-05)
        str-06 (nth (atoi (get_tile "txt-06")) list-06)
        str-07 (nth (atoi (get_tile "txt-07")) list-07)
        str-99 (nth (atoi (get_tile "txt-08")) list-08)
        
        list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04 "  " str-05  "  Для контакторов " str-06 "  " str-07) list-901)
        
        tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06)
                           (cons 99 str-99))
   );setq
);if

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-contactors-abb-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-07 str-08 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-01 (cdr (assoc 1 str-tmp))
  );setq

  (setvar "osmode" 6199)
  
  (setq pnt-ins (getpoint "\nУкажите точку вставки\n")); setq

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (or (= str-01 "Контактор AF")
					(= str-01 "Контактор B6"));or
    (progn
      (setq str-02 (cdr (assoc 2 str-tmp))
            str-03 (cdr (assoc 3 str-tmp))
            str-05 (cdr (assoc 5 str-tmp)) 
            str-07 (cdr (assoc 7 str-tmp))
            str-08 (cdr (assoc 8 str-tmp))
      );setq
      
      (if (= str-07 "Нет") (setq str-07 "нет"));

			(setq str-701 (strcat "Контактор ABB " str-02 ", Iном. " str-05 "А, Uупр. " str-08 ", доп. контакты " str-07));setq
    );progn
  );=

  
  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-01 "Доп. контакты AF")
    (setq str-02 (cdr (assoc 2 str-tmp))
          str-03 (cdr (assoc 3 str-tmp))
          str-04 (cdr (assoc 4 str-tmp))
          str-05 (cdr (assoc 5 str-tmp))
           
          str-04 (strcase str-04 1)
            
          str-701 (strcat "Блок дополнительных контактов ABB (для контакторов типа AF) " str-02 ", крепление " str-04 ", контакты " str-05)
     );setq
  );=

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-01 "Доп. контакты B6")
    (setq str-02 (cdr (assoc 2 str-tmp))
          str-03 (cdr (assoc 3 str-tmp))
          str-04 (cdr (assoc 4 str-tmp))
          str-05 (cdr (assoc 5 str-tmp))
           
          str-04 (strcase str-04 1)
            
          str-701 (strcat "Блок дополнительных контактов ABB (для контакторов типа B6-, B7-) " str-02 ", крепление " str-04 ", контакты " str-05)
     );setq
  );=

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
  (setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-contactors-abb-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-01 (cdr (assoc 1 str-tmp))
        str-02 (cdr (assoc 2 str-tmp))
        str-03 (cdr (assoc 3 str-tmp))
        str-99 (cdr (assoc 99 str-tmp))
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
  (if (= str-01 "Контактор AF")
    (progn
      (setq str-05 (cdr (assoc 5 str-tmp)) 
            str-06 (cdr (assoc 6 str-tmp))
            str-07 (cdr (assoc 7 str-tmp))
            str-08 (cdr (assoc 8 str-tmp))           
      );setq

      (cond
        ((= str-06 "Винт") (setq str-06 "винтовые"));=
      );cond

			(cond
        ((= str-07 "Нет") (setq str-07 "нет"));=
      );cond
        
      (setq nmbr-ln 4);setq
      
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Контактор")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- Iном. " str-05 "А, Uупр. " str-08))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-06 " контакты, доп. контакт(ы) " str-07))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ",")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "код заказа " str-03))
			
   
    );progn 
  );=


  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-01 "Доп. контакты AF")
    (progn
      (setq str-04 (cdr (assoc 4 str-tmp))
            str-05 (cdr (assoc 5 str-tmp))
            str-99 (cdr (assoc 99 str-tmp))
      );setq
      
      (setq nmbr-ln 4);setq
      
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок дополнительных контактов")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- для контакторов типа AF, крепление на контактор " (strcase str-04 1)))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- контакты " str-05))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ","))
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "код заказа " str-03))			      
    );progn
  );=

  (repeat nmbr-ln
    (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
    (setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
  );repeat
                
  (command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ABB, г. Москва")
      
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
(defun lecgv-101-04-contactors-abb-01-general

( / cntr-1 dlt-y pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-99 str-tmp str-tmp-99 str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-01 (cdr (assoc 1 str-tmp))
        str-02 (cdr (assoc 2 str-tmp))
        str-03 (cdr (assoc 3 str-tmp))
        str-99 (cdr (assoc 99 str-tmp))
  );setq

  (setvar "osmode" 6199)
  
  (setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-01 "Контактор AF")
    (progn
      (setq str-05 (cdr (assoc 5 str-tmp)) 
            str-06 (cdr (assoc 6 str-tmp))
            str-07 (cdr (assoc 7 str-tmp))
            str-08 (cdr (assoc 8 str-tmp))            
      );setq

      (cond
        ((= str-06 "Винт") (setq str-06 "винтовые"));=
      );cond

			(cond
        ((= str-07 "Нет") (setq str-07 "нет"));=
      );cond
 
  		(setq str-txt (strcat "Контактор ABB, " str-02 ", код заказа " str-03 ", Iном. " str-05 "А," "Uупр. " str-08 ", " str-06 " контакты, доп. контакт(ы) " str-07)
			);setq
    );progn
  );if


	;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Доп. контакты AF")
		(progn
			(setq str-04 (cdr (assoc 4 str-tmp))
            str-05 (cdr (assoc 5 str-tmp))
			
						str-txt (strcat "Блок дополнительных контактов ABB, " str-02 ", код заказа" str-03 
														", для контакторов типа AF, крепление на контактор" (strcase str-04 1) 
														", контакты " str-05)
			);setq
		);progn	
	);if

	(split-str-parts-lecgv-065-01 str-txt str-txt-01 str-txt-02 str-txt-99 pnt-ins);setq
 
  (setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////