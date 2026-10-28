;;; /////// рисование подвал ССВП /////////////////////////////
(defun c:05-cellar-scec

( / adoc circle-1 counter hatch-1 pnt-ins pnt-ins-1 r-1 x-pnt1-rectangle x-pnt-ins y-pnt1-rectangle y-pnt-ins)

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(setq counter 0);setq

(if	(= (tblsearch "block" "точка-2мм") nil)
  (progn ; выполнение первого условия, блока нет, создаем и вставляем
			(setq	pnt-ins-1	(list 0 0) ;вешаем блок на курсор
						r-1 1
			);setq
			(setvar "osmode" 0)
			(command "_circle" pnt-ins-1 r-1)
			(setq circle-1 (entlast))
			(command "_hatch" "solid" circle-1 "")
			(setq hatch-1 (entlast))
			(command "_block" "точка-2мм" pnt-ins-1 circle-1 hatch-1 "")
  );progn
);if

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint )) nil)
  (progn
    (setq x-pnt-ins (nth 0 pnt-ins)
    	    y-pnt-ins (nth 1 pnt-ins)
    );setq
    
    (if (= counter 0)
      (setq x-pnt1-rectangle (- x-pnt-ins 3)
            y-pnt1-rectangle y-pnt-ins
      );setq
    );if
    
    (setvar "osmode" 0)
    (command "_insert" "точка-2мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list x-pnt-ins (- y-pnt1-rectangle 4)))
    (command "_line" (list x-pnt-ins y-pnt1-rectangle) (list x-pnt-ins (- y-pnt1-rectangle 4)) "")
    (setvar "osmode" 6199)
    (setq counter 1+
    );setq
  );progn
);while

(setvar "osmode" 0)

(command "_rectangle" (list x-pnt1-rectangle y-pnt1-rectangle) (list (+ x-pnt-ins 3) (- y-pnt1-rectangle 8)))

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;; //////////////////////////// конец программы /////////////////////////////
