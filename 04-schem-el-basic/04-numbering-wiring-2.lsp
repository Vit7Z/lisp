;/////// ************************************************************ ////////////////////
;/////// нумерация жил XX.1, XX.2, XX.3...                            ////////////////////
;/////// ************************************************************ ////////////////////
(defun c:04-numbering-wiring-2

( / adoc crnt-obj i p1 p2 pnt-ins pnt-ins-txt str-01 str-tmp txt xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 0)
(setvar "textstyle" "standard")

(while (/= (setq str-01 (entget (car (entsel "\nВыберите начальное обозначение\n")))) nil)
  
  ;;;;;;; получаем начальный номер ///////////////////////////////////////////////////////
  (setq str-01 (cdr (assoc 1 str-01))
			  i 1
			  txt ""
  );setq

  (repeat (strlen str-01)
	  (setq str-tmp (substr str-01 i 1));setq
	  (if (wcmatch str-tmp "#")
	    (setq txt (strcat txt str-tmp));setq
	  );if
	  (setq i (+ i 1));setq
  );repeat

  (setq str-01 txt
        i 1
  );setq

  (setvar "osmode" 6199)
  
  ;;;;;;; цикл рисования жилы
  (while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	  (setq xpnt-ins (nth 0 pnt-ins)
				  ypnt-ins (nth 1 pnt-ins)
				  pnt-ins-txt (list (+ xpnt-ins 1) ypnt-ins)
	  );setq

	  (setvar "osmode" 0)
	
	  ;;;;;;; стираем, если есть текст
	  (setq p1 (list xpnt-ins ypnt-ins);точки секущей линии
			    p2 (list (+ xpnt-ins 4) (+ ypnt-ins 3))
			    crnt-obj (ssget "_C" p1 p2 '((0 . "*text")))
    );setq

    (if (/= crnt-obj nil)
      (command "_erase" crnt-obj "")
    );if
    
    (setq txt (strcat str-01 "." (itoa i)));setq
	
	  (command "_text" "_bl" pnt-ins-txt 2.5 0 txt)
	  (setvar "osmode" 6199)
	  (setq i (+ i 1));setq
  );while
);while


(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////