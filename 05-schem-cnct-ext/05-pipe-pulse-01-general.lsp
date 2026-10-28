;/////// ************************************************************ ////////////////////////////////////////
;/////// рисование импульсных труб на схеме внешних проводок          ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
(defun c:05-pipe-pulse-01-general

( / adoc block-name dcl-id lin-1 list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file 
list-04 list-04-read-file list-05 list-05-read-file list-06 list-06-read-file list-07 list-07-read-file str-01 
str-1 tgl-01 txt-1)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq str-1 nil);setq

(read-file-for-dialog-box-01 "05-pipe-pulse-01-general.txt" 7)

(setq list-01 list-01-read-file
      list-02 list-02-read-file
      list-03 list-03-read-file
      list-04 list-04-read-file
      list-05 list-05-read-file
      list-06 list-06-read-file
      list-07 list-07-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-05-pipe-pulse-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_05_pipe_pulse_01" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
	        "(set_tile \"txt-02\" str-01)"
          "(set_tile \"txt-03\" str-01)"
          "(set_tile \"txt-04\" str-01)"
          "(set_tile \"txt-05\" str-01)"
          "(set_tile \"txt-06\" str-01)"
          "(set_tile \"txt-07\" str-01)"
  );srcat
);action_tile

(action_tile "tgl-01"
  (strcat "(setq tgl-01 (get_tile \"tgl-01\"))");srcat
);action_tile

(action_tile "accept"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "cancel"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(repeat 2
  (setq block-name (vl-string-subst "-" "," str-01));setq
);repeat

(setq block-name (strcat "труба-импульсн-" block-name "-ссвп"));setq

(setvar "osmode" 0)
(if (= (tblsearch "block" block-name) nil)
	(progn				
    (command "_line" '(0 0) '(0 -12) "")
		(setq lin-1 (entlast))
		(command "_text" "_bl" '(0 -10) 2.5 90 str-01)
		(setq txt-1 (entlast))
		(command "_block" block-name '(0 0) lin-1 txt-1 "")
  );progn
);if

(if (= tgl-01 nil)
  (05-pipe-pulse-01-general-wout-numbering block-name)
);if

(if (= tgl-01 "1")
  (05-pipe-pulse-01-general-w-numbering block-name)
);if

(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************//////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////
;/////// *************************************************************//////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////
;/////// импульсная труба (диаметр х толщ. стенки) без нумерации      //////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////
(defun 05-pipe-pulse-01-general-wout-numbering

(block-name / crnt-obj p1 p2 pnt-ins pnt-txt x-pnt y-pnt)

(setvar "osmode" 6199)
(while (/= (setq pnt-ins (getpoint)) nil)
  (progn
    (setvar "osmode" 0)
    (setq x-pnt (nth 0 pnt-ins)
    	    y-pnt (nth 1 pnt-ins)
    	    pnt-txt (list (+ x-pnt 4) (- y-pnt 10))
    	    
    	    p1 (list (+ x-pnt 0.5) y-pnt)
			    p2 (list (- x-pnt 2) (- y-pnt 9))
			    crnt-obj (ssget "_C" p1 p2 '((0 . "insert")))	    
    );setq

    ;;;;;;; стираем блок имп. трубы, если он есть
    (if (/= crnt-obj nil)
      (command "_erase" crnt-obj "")
    );if
    
    (setq p1 (list (+ x-pnt 3) y-pnt)
			    p2 (list (+ x-pnt 1) (- y-pnt 10))
			    crnt-obj (ssget "_C" p1 p2 '((0 . "*text")))
    );setq
    
    ;;;;;;; стираем блок имп. трубы, если он есть
    (if (= crnt-obj nil)
      (command "_text" "_bl" pnt-txt 2.5 90 "*** м")
    );if
    
    (command "_insert" block-name "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)
    
    (setvar "osmode" 6199)
  );progn
);while

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ /////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////
;/////// импульсная труба (диаметр х толщ. стенки) без нумерации      //////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////
(defun 05-pipe-pulse-01-general-w-numbering

(block-name / pnt-2-lin pnt-ins pnt-ins-block pnt-txt-len pnt-txt-num x-pnt y-pnt)

(setvar "osmode" 6199)
(while (/= (setq pnt-ins (getpoint)) nil)
  (progn
    (setq x-pnt (nth 0 pnt-ins)
    	    y-pnt (nth 1 pnt-ins)
    	    
    	    pnt-2-lin (list x-pnt (- y-pnt 3))    	    
    	    pnt-txt-num (list x-pnt (- y-pnt 6))    	  
    	    pnt-ins-block (list x-pnt (- y-pnt 9))
    	    pnt-txt-len (list (+ x-pnt 4) (- y-pnt 19))    	    
    );setq)
    
    (setvar "osmode" 0)
    (command "_line" pnt-ins pnt-2-lin "")
    (command "_.TEXT" "_J" "_MC" pnt-txt-num 2.5 0 "0***")
    (command "_.CIRCLE" pnt-txt-num 3)
    (command "_insert" block-name "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins-block)
    (command "_text" "_bl" pnt-txt-len 2.5 90 "*** м")
    (setvar "osmode" 6199)
  );progn
);while

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ /////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////