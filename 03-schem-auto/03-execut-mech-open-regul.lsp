;///////// ИМ открывает РО ///////////////////////////////////////////////////////////////////
(defun c:03-execut-mech-open-regul

( / adoc angl angl-blck arc-1 arc-2 circle-1 lin-1 name-block pnt-drctn pnt-ins xpnt-ins ypnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(setq name-block "эим-норм-откр-им-са");setq

(if	(= (tblsearch "block" name-block) nil)
  (progn ; выполнение первого условия, блока нет, создаем и вставляем
    (command "_pline" '(0 0) "_w" 0 0 '(0 6) "_w" 2 0 '(0 10) "")
		(setq lin-1 (entlast))
		(command "_circle" '(0 12.5) 2.5)
		(setq circle-1 (entlast))
		(command "_arc" '(0 12.5) "_C" '(-1 12.5) '(-2 12.5) "")
		(setq arc-1 (entlast))
		(command "_arc" '(0 12.5) "_C" '(1 12.5) '(2 12.5) "")
		(setq arc-2 (entlast))
		(command "_block" name-block '(0 0) circle-1 lin-1 arc-1 arc-2 "");command
  );progn
);if

(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)	
			pnt-drctn (getpoint "\nУкажите точку направления\n")
			angl (atoi (angtos (angle pnt-ins pnt-drctn)))
);setq

; опеределяем угол поворота
(cond
  ((and (<= angl 315) (>= angl 225)) (setq angl-blck 0)); вниз
  
  ((and (<= angl 225) (>= angl 135)) (setq angl-blck 90));влево
	
  ((and (<= angl 135) (>= angl 45)) (setq angl-blck 0));вверх
	 
	(progn													
		(setq angl-blck 270);setq
	);progn
);cond

(setvar "osmode" 0)

(command "_insert" name-block "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////