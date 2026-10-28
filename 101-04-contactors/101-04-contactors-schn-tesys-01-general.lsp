;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-contactors-schn-tesys-01-general

( / adoc dcl-id file-name file-open list-00 list-01 list-02 list-03 list-04 list-05 list-06 list-901 list-902 path-file-open str-00 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-f 1;переменные
      str-00 nil
      list-00 (list "LC1 K"
      							"LC1 D"
      							"LC2 D"
                    "Доп. контакты LC1 K"
                    "Доп. контакты LC1 D"
                    )
      list-901 nil
      list-902 nil
      file-name nil
      file-open nil
      path-file-open nil
);setq

(txt-00-101-04-contactors-schn-tesys-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-04-contactors-schn-tesys-01-general.dcl")) 0) ;ищем диалог
    (progn
      (alert "Не найден dcl-файл")
      (exit)
    );progn
);if

(if (not (new_dialog "dia_101_04_contactors_tesys" dcl-id))
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

(action_tile "txt-00" (strcat "(txt-00-101-04-contactors-schn-tesys-01-general)"));action_tile

(action_tile "txt-01" (strcat "(txt-01-101-04-contactors-schn-tesys-01-general)"));action_tile

(action_tile "txt-02" (strcat "(txt-02-101-04-contactors-schn-tesys-01-general)"));action_tile

(action_tile "but1" 
  (strcat "(but1-101-04-contactors-schn-tesys-01-general)");strcat
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
	((= type-list "le") (le-101-04-contactors-schn-tesys-01-general));=
	((= type-list "spcf") (spcf-101-04-contactors-schn-tesys-01-general));=
	((= type-list "lecgv") (lecgv-101-04-contactors-schn-tesys-01-general));=
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
(defun txt-00-101-04-contactors-schn-tesys-01-general

( / )

(if (= nil str-00) 
  (setq str-00 "LC1 K");setq
  (setq str-00 (nth (atoi (get_tile "txt-00")) list-00));setq
);if

(cond
	((= str-00 "LC1 K")
    (progn
      (set_tile "ptxt-021" "Номин. ток, А")
      (set_tile "ptxt-022" "(AC-3, до 440В)")
      (set_tile "ptxt-023" "")
      (set_tile "ptxt-031" "Тип")
      (set_tile "ptxt-032" "соединения")
      (set_tile "ptxt-033" "")    
      (set_tile "ptxt-041" "Доп.")
      (set_tile "ptxt-042" "контакты")
      (set_tile "ptxt-043" "")
      (set_tile "ptxt-051" "Упр.")
      (set_tile "ptxt-052" "напряжение")
      (set_tile "ptxt-053" "")
      (set_tile "ptxt-061" "Кол.")
      (set_tile "ptxt-062" "полюсов")
      (set_tile "ptxt-063" "")
      (set_tile "ptxt-071" "Контакторы общего назначения.")
      (read-file-101-04-contactors-schn-tesys-01-general "101-04-contactors-schn-tesys-lc1-k.txt" 4)
      (setq list-05 (list "220 В, перем. ток" "110 В, перем. ток" "127 В, перем. ток")
            list-06 (list "3 полюса")
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
    );progn
  ); str-1

	((= str-00 "LC1 D")
    (progn
      (set_tile "ptxt-021" "Номин. ток, А")
      (set_tile "ptxt-022" "(AC-3, до 440В)")
      (set_tile "ptxt-023" "")
      (set_tile "ptxt-031" "Тип")
      (set_tile "ptxt-032" "соединения")
      (set_tile "ptxt-033" "")    
      (set_tile "ptxt-041" "Доп.")
      (set_tile "ptxt-042" "контакты")
      (set_tile "ptxt-043" "")
      (set_tile "ptxt-051" "Упр.")
      (set_tile "ptxt-052" "напряжение")
      (set_tile "ptxt-053" "")
      (set_tile "ptxt-061" "Кол.")
      (set_tile "ptxt-062" "полюсов")
      (set_tile "ptxt-063" "")
      (set_tile "ptxt-071" "Контакторы общего назначения.")
      (read-file-101-04-contactors-schn-tesys-01-general "101-04-contactors-schn-tesys-LC1-D.txt" 4)
      (setq list-05 (list "220 В, перем. ток" "110 В, перем. ток"  "12 В, пост. ток" "24 В, пост. ток" "110 В, пост. ток" "220 В, пост. ток")
            list-06 (list "3 полюса")
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
    );progn
  ); str-1

	((= str-00 "LC2 D")
    (progn
      (set_tile "ptxt-021" "Номин. ток, А")
      (set_tile "ptxt-022" "(AC-3, до 440В)")
      (set_tile "ptxt-023" "")
      (set_tile "ptxt-031" "Тип")
      (set_tile "ptxt-032" "соединения")
      (set_tile "ptxt-033" "")    
      (set_tile "ptxt-041" "Доп.")
      (set_tile "ptxt-042" "контакты")
      (set_tile "ptxt-043" "")
      (set_tile "ptxt-051" "Упр.")
      (set_tile "ptxt-052" "напряжение")
      (set_tile "ptxt-053" "")
      (set_tile "ptxt-061" "Кол.")
      (set_tile "ptxt-062" "полюсов")
      (set_tile "ptxt-063" "")
      (set_tile "ptxt-071" "Контакторы реверсивные для управления электродвигателями до 15 кВт при 400 В, AC-3.")
      (read-file-101-04-contactors-schn-tesys-01-general "101-04-contactors-schn-tesys-LC2-D.txt" 4)
      (setq list-05 (list "220 В, перем. ток" "110 В, перем. ток" "12 В, пост. ток" "24 В, пост. ток" "110 В, пост. ток" "220 В, пост. ток")
            list-06 (list "3 полюса")
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
    );progn
  ); str-1
  
  ((= str-00 "Доп. контакты LC1 K")
    (progn
      (set_tile "ptxt-021" "Контакты")
      (set_tile "ptxt-022" "")
      (set_tile "ptxt-023" "")      
      (set_tile "ptxt-031" "Тип")
      (set_tile "ptxt-032" "соединения")
      (set_tile "ptxt-033" "")
      (set_tile "ptxt-041" "Монтаж на")
      (set_tile "ptxt-042" "контактор")
      (set_tile "ptxt-043" "")
      (set_tile "ptxt-051" "")
      (set_tile "ptxt-052" "")
      (set_tile "ptxt-053" "")
      (set_tile "ptxt-061" "")
      (set_tile "ptxt-062" "")
      (set_tile "ptxt-063" "")  
      (set_tile "ptxt-071" "")
      (read-file-101-04-contactors-schn-tesys-01-general "101-04-contactors-schn-tesys-lc1-k-add-contacts.txt" 4)
      (setq list-05 (list "")
            list-06 (list "")
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
    );progn
  ); str-1

  ((= str-00 "Доп. контакты LC1 D")
    (progn
      (set_tile "ptxt-021" "Контакты")
      (set_tile "ptxt-022" "")
      (set_tile "ptxt-023" "")      
      (set_tile "ptxt-031" "Тип")
      (set_tile "ptxt-032" "соединения")
      (set_tile "ptxt-033" "")
      (set_tile "ptxt-041" "Монтаж на")
      (set_tile "ptxt-042" "контактор")
      (set_tile "ptxt-043" "")
      (set_tile "ptxt-051" "")
      (set_tile "ptxt-052" "")
      (set_tile "ptxt-053" "")
      (set_tile "ptxt-061" "")
      (set_tile "ptxt-062" "")
      (set_tile "ptxt-063" "")  
      (set_tile "ptxt-071" "")
      (read-file-101-04-contactors-schn-tesys-01-general "101-04-contactors-schn-tesys-01-general-lc1-d-add-contacts.txt" 4)
      (setq list-05 (list "")
            list-06 (list "")
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
    );progn
  ); str-1
); cond

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма чтения данных из файлов для авт выкл/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun read-file-101-04-contactors-schn-tesys-01-general

(file-name swtch / file-open path-file-open str-f str-lft-01 str-lft-02 str-lft-03 str-lft-04)

(setq str-f 1
      str-lft-01 nil
      str-lft-02 nil
      str-lft-03 nil
      str-lft-04 nil
      list-01 nil
      list-02 nil
      list-03 nil
      list-04 nil
);setq

(setq path-file-open (findfile file-name)
      file-open (open path-file-open "r")
);setq

(if (= swtch 4)
  (progn
    (while (/= str-f nil)
      (setq str-f (read-line file-open));setq
      
      (if (/= str-f nil)
        (setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f))
              str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));2 \\
              str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
              str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));3 \\
              str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
              str-lft-04 (substr str-f (+ (vl-string-search "\\" str-f) 2)) 
            
              
              list-01 (vl-list* str-lft-01 list-01)
              list-02 (vl-list* str-lft-02 list-02)
              list-03 (vl-list* str-lft-03 list-03)
              list-04 (vl-list* str-lft-04 list-04)
        );setq
      );if
    );while
    
    (close file-open)
    
    (setq list-01 (reverse (vl-remove "" list-01))
          list-02 (reverse (vl-remove "" list-02))
          list-03 (reverse (vl-remove "" list-03))
          list-04 (reverse (vl-remove "" list-04))
    );setq
  );progn
);if

(if (= swtch 3)
  (progn
    (while (/= str-f nil)
      (setq str-f (read-line file-open));setq
      
      (if (/= str-f nil)
        (setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f))
              str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));2 \\
              str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
              str-lft-03 (substr str-f (+ (vl-string-search "\\" str-f) 2));3 \\
                            
              list-01 (vl-list* str-lft-01 list-01)
              list-02 (vl-list* str-lft-02 list-02)
              list-03 (vl-list* str-lft-03 list-03)
        );setq
      );if
    );while
    
    (close file-open)
    
    (setq list-01 (reverse (vl-remove "" list-01))
          list-02 (reverse (vl-remove "" list-02))
          list-03 (reverse (vl-remove "" list-03))
    );setq
  );progn
);if

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;; txt-01 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-contactors-schn-tesys-01-general

( / str-0 str-1 str-11 str-2)

(setq str-0 (nth (atoi (get_tile "txt-00")) list-00));setq

(if (= str-0 "LC1 K")
  (progn
    (setq str-11 (get_tile "txt-01"));setq
    (list-filling "txt-02" list-02)
    (list-filling "txt-03" list-03)
    (list-filling "txt-04" list-04)
    (set_tile "txt-02" str-11)
    (set_tile "txt-03" str-11)
    (set_tile "txt-04" str-11)
  );progn
);if

(if (= str-0 "LC1 D")
  (progn
    (setq str-11 (get_tile "txt-01"));setq
    (list-filling "txt-02" list-02)
    (list-filling "txt-03" list-03)
    (list-filling "txt-04" list-04)
    (set_tile "txt-02" str-11)
    (set_tile "txt-03" str-11)
    (set_tile "txt-04" str-11)
    
    (setq str-1 (nth (atoi (get_tile "txt-01")) list-01));setq
    
		(cond
        ((= str-1 "LC1 D150") (setq list-05 (list "220 В, перем. ток" "110 В, перем. ток" "24 В, пост. ток" "110 В, пост. ток" "220 В, пост. ток")));=
        ((/= str-1 "LC1 D150") (setq list-05 (list "220 В, перем. ток" "110 В, перем. ток" "12 В, пост. ток" "24 В, пост. ток" "110 В, пост. ток" "220 В, пост. ток")));=
    );cond
    
    (list-filling "txt-05" list-05)
    (set_tile "txt-05" "0")
  );progn
);if

(if (= str-0 "LC2 D")
  (progn
    (setq str-11 (get_tile "txt-01"));setq
    (list-filling "txt-02" list-02)
    (list-filling "txt-03" list-03)
    (list-filling "txt-04" list-04)
    (set_tile "txt-02" str-11)
    (set_tile "txt-03" str-11)
    (set_tile "txt-04" str-11)
    
    (setq str-1 (nth (atoi (get_tile "txt-01")) list-01)
    			str-2 (atoi (nth (atoi (get_tile "txt-02")) list-02));значение тока контактора, по этому индексу будет изменяться список напряжений управляющей катушки
    );setq

		(cond
    	((<= str-2 65) (setq list-05 (list "220 В, перем. ток" "110 В, перем. ток" "12 В, пост. ток" "24 В, пост. ток" "110 В, пост. ток" "220 В, пост. ток")));=
      ((> str-2 65) (setq list-05 (list "220 В, перем. ток" "110 В, перем. ток")));=
    );cond
    
    (list-filling "txt-05" list-05)
    (set_tile "txt-05" "0")
  );progn
);if

(if (= str-0 "Доп. контакты LC1 K")
  (progn
    (setq str-11 (get_tile "txt-01"));setq
    (list-filling "txt-02" list-02)
    (list-filling "txt-03" list-03)
    (list-filling "txt-04" list-04)
    
    (set_tile "txt-02" str-11)
    (set_tile "txt-03" str-11)
    (set_tile "txt-04" str-11)
  );progn
);if

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма для txt-03//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-04-contactors-schn-tesys-01-general

( / str-0 str-11)

(setq str-0 (nth (atoi (get_tile "txt-00")) list-00));setq

(if (or (= str-0 "LC1 K") (= str-0 "LC1 D"))
  (progn
    (setq str-11 (get_tile "txt-02"));setq
    (list-filling "txt-01" list-01)
    (list-filling "txt-03" list-03)
    (list-filling "txt-04" list-04)
    (set_tile "txt-01" str-11)
    (set_tile "txt-03" str-11)
    (set_tile "txt-04" str-11)
  );progn
);if

(if (= str-0 "Доп. контакты LC1 K")
  (progn
    (setq str-11 (get_tile "txt-02"));setq
    (list-filling "txt-01" list-01)
    (list-filling "txt-03" list-03)
    (set_tile "txt-01" str-11)
    (set_tile "txt-03" str-11)
  );progn
);if

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-contactors-schn-tesys-01-general

( / cntr-1 str-00 str-01 swtch tmp-list-902 tmp-str-01 tmp-str-02 tmp-str-03 tmp-str-04 tmp-str-05 tmp-str-06 tmp-str-99)

;заполняем поле "выбрано"
(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(if (= str-00 "LC1 K")
  (progn
    (setq str-01 (read (strcat "(" (get_tile "txt-01") ")")));setq
    
    (repeat (length str-01)
      (setq tmp-str-01 (nth (nth cntr-1 str-01) list-01)
            tmp-str-02 (nth (nth cntr-1 str-01) list-02)
            tmp-str-03 (nth (nth cntr-1 str-01) list-03)
            tmp-str-04 (nth (nth cntr-1 str-01) list-04)
            tmp-str-05 (nth (atoi (get_tile "txt-05")) list-05)
            tmp-str-06 (nth (atoi (get_tile "txt-06")) list-06)
      );setq

      (setq list-901 (vl-list* (strcat "Контактор " tmp-str-01 "  " 
                                       "Iном.=" tmp-str-02 "А  " 
                                       "Соединение " tmp-str-03 "  " 
                                       "Доп. контакты " tmp-str-04 "  " 
                                       "Упр. напряжение " tmp-str-05 "  " 
                                       tmp-str-06) list-901)
      );setq
      
      (setq tmp-list-902 (list (cons 0 str-00) 
                               (cons 1 tmp-str-01) 
                               (cons 2 tmp-str-02) 
                               (cons 3 tmp-str-03) 
                               (cons 4 tmp-str-04) 
                               (cons 5 tmp-str-05) 
                               (cons 6 tmp-str-06)
                               (cons 99 "0,3"))
            list-902 (vl-list*  tmp-list-902 list-902)
      );setq
      
      (setq cntr-1 (1+ cntr-1));setq
    );repeat
  );progn 
);if = str-00

(if (= str-00 "LC1 D")
  (progn
    (setq str-01 (read (strcat "(" (get_tile "txt-01") ")")));setq
    
    (repeat (length str-01)
      (setq tmp-str-01 (nth (nth cntr-1 str-01) list-01)
            tmp-str-02 (nth (nth cntr-1 str-01) list-02)
            tmp-str-03 (nth (nth cntr-1 str-01) list-03)
            tmp-str-04 (nth (nth cntr-1 str-01) list-04)
            tmp-str-05 (nth (atoi (get_tile "txt-05")) list-05)
            tmp-str-06 (nth (atoi (get_tile "txt-06")) list-06)
      );setq

      (setq list-901 (vl-list* (strcat "Контактор " tmp-str-01 "  " 
                                       "Iном.=" tmp-str-02 "А  " 
                                       "Соединение " tmp-str-03 "  " 
                                       "Доп. контакты " tmp-str-04 "  " 
                                       "Упр. напряжение " tmp-str-05 "  " 
                                       tmp-str-06) list-901)
      );setq
      
      (cond
        ((<= tmp-str-02 "38") (setq tmp-str-99 "0,4"));=
        ((and (> tmp-str-02 "38") (<= tmp-str-02 "95")) (setq tmp-str-99 "1,6"));=
        ((> tmp-str-02 "95") (setq tmp-str-99 "2,5"));=
    	);cond
      
      (setq tmp-list-902 (list (cons 0 str-00) 
                               (cons 1 tmp-str-01) 
                               (cons 2 tmp-str-02) 
                               (cons 3 tmp-str-03) 
                               (cons 4 tmp-str-04) 
                               (cons 5 tmp-str-05) 
                               (cons 6 tmp-str-06)
                               (cons 99 tmp-str-99))
            list-902 (vl-list*  tmp-list-902 list-902)
      );setq
      
      (setq cntr-1 (1+ cntr-1));setq
    );repeat
  );progn 
);if = str-00

(if (= str-00 "LC2 D")
  (progn
    (setq str-01 (read (strcat "(" (get_tile "txt-01") ")")));setq
    
    (repeat (length str-01)
      (setq tmp-str-01 (nth (nth cntr-1 str-01) list-01)
            tmp-str-02 (nth (nth cntr-1 str-01) list-02)
            tmp-str-03 (nth (nth cntr-1 str-01) list-03)
            tmp-str-04 (nth (nth cntr-1 str-01) list-04)
            tmp-str-05 (nth (atoi (get_tile "txt-05")) list-05)
            tmp-str-06 (nth (atoi (get_tile "txt-06")) list-06)
      );setq

      (setq list-901 (vl-list* (strcat "Контактор " tmp-str-01 "  " 
                                       "Iном.=" tmp-str-02 "А  " 
                                       "Соединение " tmp-str-03 "  " 
                                       "Доп. контакты " tmp-str-04 "  " 
                                       "Упр. напряжение " tmp-str-05 "  " 
                                       tmp-str-06) list-901)
      );setq
      
      (cond
        ((<= tmp-str-02 "18") (setq tmp-str-99 "0,71"));=
        ((and (> tmp-str-02 "18") (<= tmp-str-02 "38")) (setq tmp-str-99 "0,81"));=
        ((and (> tmp-str-02 "38") (<= tmp-str-02 "65")) (setq tmp-str-99 "1,9"));=
        ((>= tmp-str-02 "80") (setq tmp-str-99 "3,2"));=
    	);cond
      
      (setq tmp-list-902 (list (cons 0 str-00) 
                               (cons 1 tmp-str-01) 
                               (cons 2 tmp-str-02) 
                               (cons 3 tmp-str-03) 
                               (cons 4 tmp-str-04) 
                               (cons 5 tmp-str-05) 
                               (cons 6 tmp-str-06)
                               (cons 99 tmp-str-99))
            list-902 (vl-list*  tmp-list-902 list-902)
      );setq
      
      (setq cntr-1 (1+ cntr-1));setq
    );repeat
  );progn 
);if = str-00

(if (or (= str-00 "Доп. контакты LC1 K")
				(= str-00 "Доп. контакты LC1 D"))
  (progn
    (setq str-01 (read (strcat "(" (get_tile "txt-01") ")")));setq
  
    (repeat (length str-01)
      (setq tmp-str-01 (nth (nth cntr-1 str-01) list-01)
            tmp-str-02 (nth (nth cntr-1 str-01) list-02)
            tmp-str-03 (nth (nth cntr-1 str-01) list-03)
            tmp-str-04 (nth (nth cntr-1 str-01) list-04)
      );setq

      (setq list-901 (vl-list* (strcat str-00 "  " 
                                       tmp-str-01 "  " 
                                       tmp-str-02 "  " 
                                       tmp-str-04) list-901)
      );setq
      
      (setq tmp-list-902 (list (cons 0 str-00) 
                               (cons 1 tmp-str-01) 
                               (cons 2 tmp-str-02) 
                               (cons 3 tmp-str-03)
                               (cons 4 tmp-str-04)
                               (cons 99 "0,05"))
            list-902 (vl-list*  tmp-list-902 list-902)
      );setq
      (setq cntr-1 (1+ cntr-1));setq
    );repeat
  );progn 
);if = str-00

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-contactors-schn-tesys-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-21 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-51 str-tmp-52 str-tmp-53 str-tmp-6 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-0 (cdr (assoc 0 str-tmp))
  );setq

  (setvar "osmode" 6199)
  
  (setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

  (setvar "osmode" 0)

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "LC1 K")
    (progn
      (setq str-1 (cdr (assoc 1 str-tmp))
            str-2 (cdr (assoc 2 str-tmp))
            str-3 (cdr (assoc 3 str-tmp))
            str-4 (cdr (assoc 4 str-tmp))
            str-5 (cdr (assoc 5 str-tmp)) 
            str-6 (cdr (assoc 6 str-tmp))
      );setq
      
      (cond
        ((= str-4 "1НО") (setq str-4 "1 замыкающий контакт"));=
        ((= str-4 "1НЗ") (setq str-4 "1 размыкающий контакт"));=
      );cond
  
      (cond
        ((= str-5 "220 В, перем. ток") (setq str-51 "M7" str-52 "~220В"));=
        ((= str-5 "110 В, перем. ток") (setq str-51 "F7" str-52 "~110В"));=
        ((= str-5 "127 В, перем. ток") (setq str-51 "FC7" str-52 "~127В"));=
      );cond
      

  		
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Контактор Schneider Electric, серия TeSys К, артикул"))
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-1 str-51 ", Iном.=" str-2 "А, Uупр. " str-52 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-6 ", " str-4))
    );progn 
  );=

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "LC1 D")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-5 (cdr (assoc 5 str-tmp)) 
            str-tmp-6 (cdr (assoc 6 str-tmp))
      );setq
      
      (cond
        ((= str-tmp-4 "1НО, 1НЗ") (setq str-tmp-4 "1 замыкающий контакт, 1 размыкающий контакт"));=
      );cond
  
      (cond
        ((= str-tmp-5 "220 В, перем. ток") (setq str-tmp-51 "M7" str-tmp-52 "~220В"));=
        ((= str-tmp-5 "110 В, перем. ток") (setq str-tmp-51 "F7" str-tmp-52 "~110В"));=
        ((= str-tmp-5 "12 В, пост. ток") (setq str-tmp-51 "JD" str-tmp-52 "=12В"));=
        ((= str-tmp-5 "24 В, пост. ток") (setq str-tmp-51 "BD" str-tmp-52 "=24В"));=
        ((= str-tmp-5 "110 В, пост. ток") (setq str-tmp-51 "FD" str-tmp-52 "=110В"));=
        ((= str-tmp-5 "220 В, пост. ток") (setq str-tmp-51 "MD" str-tmp-52 "=220В"));=
      );cond

      (setq nmbr-ln 4);setq
      
      (1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
      (setvar "osmode" 0)
  		(setvar "cmdecho" 0)
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Контактор Schneider Electric, серия TeSys D, артикул"))
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-1 str-tmp-51 ", Iном.=" str-tmp-2 "А, управляющее напряжение " str-tmp-52 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-6 ", " str-tmp-4))
    );progn 
  );=

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "LC2 D")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-5 (cdr (assoc 5 str-tmp)) 
            str-tmp-6 (cdr (assoc 6 str-tmp))
      );setq
      
      (cond
        ((= str-tmp-4 "1НО, 1НЗ") (setq str-tmp-4 "1 замыкающий контакт, 1 размыкающий контакт"));=
      );cond
  
      (cond
        ((= str-tmp-5 "220 В, перем. ток") (setq str-tmp-51 "M7" str-tmp-52 "220В"));=
        ((= str-tmp-5 "110 В, перем. ток") (setq str-tmp-51 "F7" str-tmp-52 "110В"));=
        ((= str-tmp-5 "12 В, пост. ток") (setq str-tmp-51 "JD" str-tmp-52 "12В"));=
        ((= str-tmp-5 "24 В, пост. ток") (setq str-tmp-51 "BD" str-tmp-52 "24В"));=
        ((= str-tmp-5 "110 В, пост. ток") (setq str-tmp-51 "FD" str-tmp-52 "110В"));=
        ((= str-tmp-5 "220 В, пост. ток") (setq str-tmp-51 "MD" str-tmp-52 "220В"));=
      );cond

      (setq nmbr-ln 4);setq
      
      (1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
      (setvar "osmode" 0)
  		(setvar "cmdecho" 0)
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Контактор реверсивный Schneider Electric, серия TeSys D, артикул"))
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-1 str-tmp-51 ", Iном.=" str-tmp-2 "А, управляющее напряжение " str-tmp-52 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-6 ", " str-tmp-4))
    );progn 
  );=
  
  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "Доп. контакты LC1 K")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            nmbr-ln 4
      );setq
      
      (1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
      (setvar "osmode" 0)
  		(setvar "cmdecho" 0)
  		
			(cond
				((= str-tmp-2 "2НО") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакт"));=
		  	((= str-tmp-2 "1НО, 1НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 1 размыкающий контакт"));=
		  	((= str-tmp-2 "4НО") (setq str-tmp-2 "4 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "3НО, 1НЗ") (setq str-tmp-2 "3 замыкающих" str-tmp-21 "контакта, 1 замыкающий контакт"));=
		  	((= str-tmp-2 "2НО, 2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта, 2 размыкающих контакта"));=
		  	((= str-tmp-2 "1НО, 3НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 3 размыкающих контакта"));=
		  	((= str-tmp-2 "4НЗ") (setq str-tmp-2 "4 размыкающих" str-tmp-21 "контакта"));=
			);cond

      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Блок дополнительных контактов Schneider Electric, серия TeSys К,"))

      (cond
      	((= str-tmp-21 nil) 
      		(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-1 ", " str-tmp-2 ","))
      		(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "крепление " (strcase str-tmp-4 1)))
      	);=
      	((/= str-tmp-21 nil) 
      		(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-1 ", " str-tmp-2))
      		(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-21 ", крепление " (strcase str-tmp-4 1)))
      	);=
      );cond
    );progn 
  );=

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "Доп. контакты LC1 D")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            nmbr-ln 4
      );setq
      
      (1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
      (setvar "osmode" 0)
  		(setvar "cmdecho" 0)
			(cond
				((= str-tmp-2 "2НО") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакт"));=
		  	((= str-tmp-2 "1НО, 1НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 1 размыкающий контакт"));=
		  	((= str-tmp-2 "4НО") (setq str-tmp-2 "4 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "3НО, 1НЗ") (setq str-tmp-2 "3 замыкающих" str-tmp-21 "контакта, 1 замыкающий контакт"));=
		  	((= str-tmp-2 "2НО, 2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта, 2 размыкающих контакта"));=
		  	((= str-tmp-2 "1НО, 3НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 3 размыкающих контакта"));=
		  	((= str-tmp-2 "4НЗ") (setq str-tmp-2 "4 размыкающих" str-tmp-21 "контакта"));=
			);cond
      (command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Блок дополнительных контактов Schneider Electric, серия TeSys D,"))
      (cond
      	((= str-tmp-21 nil) 
      		(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-1 ", " str-tmp-2 ","))
      		(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "крепление " (strcase str-tmp-4 1)))
      	);=
      	((/= str-tmp-21 nil) 
      		(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-1 ", " str-tmp-2))
      		(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-21 ", крепление " (strcase str-tmp-4 1)))
      	);=
      );cond
    );progn 
  );=

  (setq cntr-1 (1+ cntr-1));setq
  
  (repeat nmbr-ln
    (command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
    (setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
  );repeat
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-contactors-schn-tesys-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-21 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-51 str-tmp-52 str-tmp-6 str-tmp-7 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-tmp-0 (cdr (assoc 0 str-tmp))
  );setq
  
;(princ "\n       str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV
  
  
  (setvar "osmode" 6199)
  (setq pnt-ins   (getpoint "\nУкажите точку вставки\n")
        x-pnt-ins (nth 0 pnt-ins)
        y-pnt-ins (nth 1 pnt-ins)
        y-pnt-ins-1 y-pnt-ins
        dlt-y 8
  ); setq
  (101-empt-lin-spcf)
  (setvar "osmode" 0)
  (setvar "cmdecho" 0)

  ;обработка данных
  
  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "LC1 K")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-5 (cdr (assoc 5 str-tmp)) 
            str-tmp-6 (cdr (assoc 6 str-tmp))
            str-tmp-7 (cdr (assoc 7 str-tmp))
            str-tmp-99 (cdr (assoc 99 str-tmp))
      );setq

      (cond
        ((= str-tmp-3 "Винт") (setq str-tmp-3 "винтовые"));=
      );cond
     
      (cond
        ((= str-tmp-4 "1НО") (setq str-tmp-4 "1 замыкающий контакт"));=
      );cond
  
      (cond
        ((= str-tmp-5 "220 В, перем. ток") (setq str-tmp-51 "M7" str-tmp-52 "~220В"));=
        ((= str-tmp-5 "110 В, перем. ток") (setq str-tmp-51 "F7" str-tmp-52 "~110В"));=
        ((= str-tmp-5 "127 В, перем. ток") (setq str-tmp-51 "FC7" str-tmp-52 "~127В"));=
      );cond
      
      (setq nmbr-ln 5);setq
      
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Контактор")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- серия TeSys К")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- Iном.=" str-tmp-2 "А, " str-tmp-6 ", управляющее напряжение " str-tmp-52))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- " str-tmp-4 ", " str-tmp-3 " контакты"))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1 str-tmp-51)) ;Тип, марка, обозначение документа, опросного листа
	
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)      
    );progn 
  );=

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "LC1 D")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-5 (cdr (assoc 5 str-tmp)) 
            str-tmp-6 (cdr (assoc 6 str-tmp))
            str-tmp-7 (cdr (assoc 7 str-tmp))
            str-tmp-99 (cdr (assoc 99 str-tmp))
      );setq

      (cond
        ((= str-tmp-3 "Винт") (setq str-tmp-3 "винтовые"));=
      );cond
     
      (cond
        ((= str-tmp-4 "1НО, 1НЗ") (setq str-tmp-4 "1 замыкающий контакт, 1 размыкающий контакт"));=
      );cond
  
      (cond
        ((= str-tmp-5 "220 В, перем. ток") (setq str-tmp-51 "M7" str-tmp-52 "~220В"));=
        ((= str-tmp-5 "110 В, перем. ток") (setq str-tmp-51 "F7" str-tmp-52 "~110В"));=
        ((= str-tmp-5 "127 В, перем. ток") (setq str-tmp-51 "FC7" str-tmp-52 "~127В"));=
      );cond
      
      (setq nmbr-ln 6);setq
      
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Контактор")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- серия TeSys D")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- Iном.=" str-tmp-2 "А, " str-tmp-6 ", управляющее напряжение " str-tmp-52))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- " str-tmp-4))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- " str-tmp-3 " контакты"))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1 str-tmp-51)) ;Тип, марка, обозначение документа, опросного листа
	
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)      
    );progn 
  );=

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "LC2 D")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-5 (cdr (assoc 5 str-tmp)) 
            str-tmp-6 (cdr (assoc 6 str-tmp))
            str-tmp-7 (cdr (assoc 7 str-tmp))
            str-tmp-99 (cdr (assoc 99 str-tmp))
      );setq

      (cond
        ((= str-tmp-3 "Винт") (setq str-tmp-3 "винтовые"));=
      );cond

      (cond
        ((= str-tmp-4 "1НО, 1НЗ") (setq str-tmp-4 "1 замыкающий контакт, 1 размыкающий контакт"));=
      );cond
  
      (cond
        ((= str-tmp-5 "220 В, перем. ток") (setq str-tmp-51 "M7" str-tmp-52 "~220В"));=
        ((= str-tmp-5 "110 В, перем. ток") (setq str-tmp-51 "F7" str-tmp-52 "~110В"));=
        ((= str-tmp-5 "127 В, перем. ток") (setq str-tmp-51 "FC7" str-tmp-52 "~127В"));=
      );cond
      
      (setq nmbr-ln 6);setq
      
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Контактор реверсивный")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- серия TeSys D")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- Iном.=" str-tmp-2 "А, " str-tmp-6 ", управляющее напряжение " str-tmp-52))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- " str-tmp-4))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- " str-tmp-3 " контакты"))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1 str-tmp-51)) ;Тип, марка, обозначение документа, опросного листа
	
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)      
    );progn 
  );=


  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "Доп. контакты LC1 K")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-99 (cdr (assoc 99 str-tmp))
      );setq
			(cond
				((= str-tmp-2 "2НО") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакт"));=
		  	((= str-tmp-2 "1НО, 1НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 1 размыкающий контакт"));=
		  	((= str-tmp-2 "4НО") (setq str-tmp-2 "4 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "3НО, 1НЗ") (setq str-tmp-2 "3 замыкающих" str-tmp-21 "контакта, 1 замыкающий контакт"));=
		  	((= str-tmp-2 "2НО, 2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта, 2 размыкающих контакта"));=
		  	((= str-tmp-2 "1НО, 3НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 3 размыкающих контакта"));=
		  	((= str-tmp-2 "4НЗ") (setq str-tmp-2 "4 размыкающих" str-tmp-21 "контакта"));=
			);cond
      
      (setq nmbr-ln 5);setq
      
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок дополнительных контактов")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- для контакторов типа LC1 K (серия TeSys)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-tmp-2))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- крепление " (strcase str-tmp-4 1)))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-1) ;Тип, марка, обозначение документа, опросного листа
	
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)      
    );progn 
  );=

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "Доп. контакты LC1 D")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-99 (cdr (assoc 99 str-tmp))
      );setq
			(cond
				((= str-tmp-2 "2НО") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакт"));=
		  	((= str-tmp-2 "1НО, 1НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 1 размыкающий контакт"));=
		  	((= str-tmp-2 "4НО") (setq str-tmp-2 "4 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "3НО, 1НЗ") (setq str-tmp-2 "3 замыкающих" str-tmp-21 "контакта, 1 замыкающий контакт"));=
		  	((= str-tmp-2 "2НО, 2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта, 2 размыкающих контакта"));=
		  	((= str-tmp-2 "1НО, 3НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 3 размыкающих контакта"));=
		  	((= str-tmp-2 "4НЗ") (setq str-tmp-2 "4 размыкающих" str-tmp-21 "контакта"));=
			);cond
      
      (setq nmbr-ln 5);setq
      
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок дополнительных контактов")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- для контакторов типа LC1 D (серия TeSys)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-tmp-2))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- крепление " (strcase str-tmp-4 1)))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-1) ;Тип, марка, обозначение документа, опросного листа
	
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)      
    );progn 
  );=





















  
  

  (repeat nmbr-ln
    (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
    (setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
  );repeat
                
  (command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "\"Schneider Electric\",")
  (command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")
      
  (command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
 
  (setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-contactors-schn-tesys-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-21 str-tmp-3 str-tmp-4 str-tmp-41 str-tmp-42 str-tmp-5 str-tmp-51 str-tmp-52 str-tmp-6 
str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setq str-tmp (nth cntr-1 list-902)
        str-tmp-0 (cdr (assoc 0 str-tmp))
  );setq

  (setvar "osmode" 6199)
  (setq pnt-ins   (getpoint "\nУкажите точку вставки\n")
        x-pnt-ins (nth 0 pnt-ins)
        y-pnt-ins (nth 1 pnt-ins)
        y-pnt-ins-1 y-pnt-ins
        dlt-y 8
  ); setq
  
  (09-empt-lin-le-cgv)
  (setvar "osmode" 0)
  (setvar "cmdecho" 0)

  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "LC1 K")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-5 (cdr (assoc 5 str-tmp)) 
            str-tmp-6 (cdr (assoc 6 str-tmp))
            str-tmp-99 (cdr (assoc 99 str-tmp))
      );setq
      
      (cond
        ((= str-tmp-4 "1НО") (setq str-tmp-4 "1 замыкающий"));=
      );cond
      
      (cond
        ((= str-tmp-5 "220 В, перем. ток") (setq str-tmp-51 "M7" str-tmp-52 "~220В"));=
        ((= str-tmp-5 "110 В, перем. ток") (setq str-tmp-51 "F7" str-tmp-52 "~110В"));=
        ((= str-tmp-5 "127 В, перем. ток") (setq str-tmp-51 "FC7" str-tmp-52 "~127В"));=
      );cond
      
      (setq nmbr-ln 6);setq
      
      (1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
      (setvar "osmode" 0)
  		(setvar "cmdecho" 0)
  		
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Контактор Schneider Electric,")
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "серия Tesys К, артикул " str-tmp-1 str-tmp-51 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "Iном.=" str-tmp-2 "А, управляющее напряжение"))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-52 ", " str-tmp-6 ", " str-tmp-4))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "контакт")
      
      (command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)
    );progn 
  );if
	
  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "LC1 D")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-5 (cdr (assoc 5 str-tmp)) 
            str-tmp-6 (cdr (assoc 6 str-tmp))
            str-tmp-99 (cdr (assoc 99 str-tmp))
      );setq
      
      (cond
        ((= str-tmp-3 "Винт") (setq str-tmp-3 "винтовой зажим"));=
      );cond
      
      (cond
        ((= str-tmp-4 "1НО, 1НЗ") (setq str-tmp-41 "1 замыкающий контакт" str-tmp-42 "1 размыкающий контакт"));=
      );cond
  
      (cond
        ((= str-tmp-5 "220 В, перем. ток") (setq str-tmp-51 "M7" str-tmp-52 "~220В"));=
        ((= str-tmp-5 "110 В, перем. ток") (setq str-tmp-51 "F7" str-tmp-52 "~110В"));=
        ((= str-tmp-5 "12 В, пост. ток") (setq str-tmp-51 "JD" str-tmp-52 "=12В"));=
        ((= str-tmp-5 "24 В, пост. ток") (setq str-tmp-51 "BD" str-tmp-52 "=24В"));=
        ((= str-tmp-5 "110 В, пост. ток") (setq str-tmp-51 "FD" str-tmp-52 "=110В"));=
        ((= str-tmp-5 "220 В, пост. ток") (setq str-tmp-51 "MD" str-tmp-52 "=220В"));=
      );cond
      
      (setq nmbr-ln 7);setq
      
      (1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
      (setvar "osmode" 0)
  		(setvar "cmdecho" 0)
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Контактор Schneider Electric,")
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "серия Tesys К, артикул " str-tmp-1 str-tmp-51 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "Iном.=" str-tmp-2 "А, управляющее напряжение"))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-52 ", " str-tmp-6 ", " str-tmp-3 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat str-tmp-41 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 str-tmp-42)
      
      (command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)
    );progn 
  );if
  	
  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-tmp-0 "LC2 D")
    (progn
      (setq str-tmp-1 (cdr (assoc 1 str-tmp))
            str-tmp-2 (cdr (assoc 2 str-tmp))
            str-tmp-3 (cdr (assoc 3 str-tmp))
            str-tmp-4 (cdr (assoc 4 str-tmp))
            str-tmp-5 (cdr (assoc 5 str-tmp)) 
            str-tmp-6 (cdr (assoc 6 str-tmp))
            str-tmp-99 (cdr (assoc 99 str-tmp))
      );setq
      
      (cond
        ((= str-tmp-3 "Винт") (setq str-tmp-3 "винтовой зажим"));=
      );cond
      
      (cond
        ((= str-tmp-4 "1НО, 1НЗ") (setq str-tmp-41 "1 замыкающий контакт" str-tmp-42 "1 размыкающий контакт"));=
      );cond
  
      (cond
        ((= str-tmp-5 "220 В, перем. ток") (setq str-tmp-51 "M7" str-tmp-52 "~220В"));=
        ((= str-tmp-5 "110 В, перем. ток") (setq str-tmp-51 "F7" str-tmp-52 "~110В"));=
        ((= str-tmp-5 "12 В, пост. ток") (setq str-tmp-51 "JD" str-tmp-52 "=12В"));=
        ((= str-tmp-5 "24 В, пост. ток") (setq str-tmp-51 "BD" str-tmp-52 "=24В"));=
        ((= str-tmp-5 "110 В, пост. ток") (setq str-tmp-51 "FD" str-tmp-52 "=110В"));=
        ((= str-tmp-5 "220 В, пост. ток") (setq str-tmp-51 "MD" str-tmp-52 "=220В"));=
      );cond
      
      (setq nmbr-ln 8);setq
      
      (1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
      
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Контактор реверсивный ")
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Schneider Electric, серия Tesys К,"))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-tmp-1 str-tmp-51 ", Iном.=" str-tmp-2 "А,"))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "управляющее напряжение " str-tmp-52 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat str-tmp-6 ", " str-tmp-3 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat str-tmp-41 ","))
      (command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 str-tmp-42)
      
      (command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)
    );progn 
  );if


	;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-0 "Доп. контакты LC1 K")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-99 (cdr (assoc 99 str-tmp))
						nmbr-ln 5
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(cond
				((= str-tmp-2 "2НО") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакт"));=
		  	((= str-tmp-2 "1НО, 1НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 1 размыкающий контакт"));=
		  	((= str-tmp-2 "4НО") (setq str-tmp-2 "4 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "3НО, 1НЗ") (setq str-tmp-2 "3 замыкающих" str-tmp-21 "контакта, 1 замыкающий контакт"));=
		  	((= str-tmp-2 "2НО, 2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта, 2 размыкающих контакта"));=
		  	((= str-tmp-2 "1НО, 3НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 3 размыкающих контакта"));=
		  	((= str-tmp-2 "4НЗ") (setq str-tmp-2 "4 размыкающих" str-tmp-21 "контакта"));=
			);cond

			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок дополнительных контактов")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Schneider Electric, серия TeSys К,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-tmp-1 ", " str-tmp-2))
			

      (cond
      	((or (= str-tmp-21 "контакта") (= str-tmp-21 "контакт"))
      		(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-21 ", крепление " (strcase str-tmp-4 1)))
      	);=
      	((and (/= str-tmp-21 "контакта") (/= str-tmp-21 "контакт"))
      		(setq nmbr-ln 6);setq	
      		(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-21 ","))
      		(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "крепление " (strcase str-tmp-4 1)))
      	);=
      );cond
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)
		);progn	
	);if = str-00   /////////////////////////////////////////////////////////////////////////////////////////////////////////////


	;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-0 "Доп. контакты LC1 D")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-99 (cdr (assoc 99 str-tmp))
						nmbr-ln 5
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(cond
				((= str-tmp-2 "2НО") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакт"));=
		  	((= str-tmp-2 "1НО, 1НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 1 размыкающий контакт"));=
		  	((= str-tmp-2 "4НО") (setq str-tmp-2 "4 замыкающих" str-tmp-21 "контакта"));=
		  	((= str-tmp-2 "3НО, 1НЗ") (setq str-tmp-2 "3 замыкающих" str-tmp-21 "контакта, 1 замыкающий контакт"));=
		  	((= str-tmp-2 "2НО, 2НЗ") (setq str-tmp-2 "2 замыкающих" str-tmp-21 "контакта, 2 размыкающих контакта"));=
		  	((= str-tmp-2 "1НО, 3НЗ") (setq str-tmp-2 "1 замыкающий" str-tmp-21 "контакт, 3 размыкающих контакта"));=
		  	((= str-tmp-2 "4НЗ") (setq str-tmp-2 "4 размыкающих" str-tmp-21 "контакта"));=
			);cond

			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок дополнительных контактов")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Schneider Electric, серия TeSys D,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-tmp-1 ", " str-tmp-2))
			

      (cond
      	((or (= str-tmp-21 "контакта") (= str-tmp-21 "контакт"))
      		(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-21 ", крепление " (strcase str-tmp-4 1)))
      	);=
      	((and (/= str-tmp-21 "контакта") (/= str-tmp-21 "контакт"))
      		(setq nmbr-ln 6);setq	
      		(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-21 ","))
      		(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "крепление " (strcase str-tmp-4 1)))
      	);=
      );cond
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)
		);progn	
	);if = str-00   /////////////////////////////////////////////////////////////////////////////////////////////////////////////









  (repeat nmbr-ln
    (command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
    (setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
  );repeat
 
  (setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////