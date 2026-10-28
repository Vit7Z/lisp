;///////////////// рисование контакт переключающий //////////////////////////
(defun c:04-limit-switch-switching

( / angl angl-blck line-1 line-2 line-3 line-5 line-6 pnt-1 pnt-drct pnt-ins xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)

(command "_.undo" "_begin")

(if	(= (tblsearch "block" "выкл-конечн-перекл-спэ") nil) ; ищем блок с именем авт-выкл-1пол
  (progn ; выполнение первого услови€, блока нет, создаем и вставл€ем
    (setvar "osmode" 0)

    (setvar	"CLAYER" "0")
    (setq pnt-1 (polar '(2.625 0) (angtof "30" 0) 4.3301));setq
    (command "_line" '(0 0) '(2.625 0) "")
    (setq line-1 (entlast))
    (command "_line" '(2.625 0) pnt-1 "");наклонна€ лини€
    (setq line-2 (entlast))
    (command "_line" '(6.38 0) '(9 0) "")
    (setq line-3 (entlast))
    (command "_line" '(6.38 2) '(6.38 5) "")
    (setq line-5 (entlast))
    (command "_line" '(6.38 5) '(9 5) "")
    (setq line-6 (entlast))
    (command "_block" "выкл-конечн-перекл-спэ" '(0 0) line-1 line-2 line-3 line-5 line-6 ""
		);command
  );progn
);if

(setvar "osmode" 6199)
(setq	pnt-ins (getpoint "\n”кажите точку вставки\n")
      xpnt-ins (nth 0 pnt-ins)
      ypnt-ins (nth 1 pnt-ins)
			pnt-drct (getpoint "\n”кажите направление\n")
			angl (atoi (angtos (angle pnt-ins pnt-drct))) ; угол вставки
);setq

; опередел€ем угол поворота
(cond
  ((and  (<= angl 135) (>= angl 45));вверх
    (setq angl-blck 90);setq
  );=
  
  ((and (<= angl 225) (>= angl 135));влево
    (setq angl-blck 0
          pnt-ins (list (- xpnt-ins 9) ypnt-ins)
    );setq
	);=
	
  ((and (<= angl 315) (>= angl 225));вниз
    (setq angl-blck 90
          pnt-ins (list xpnt-ins (- ypnt-ins 9))
    );setq
	);=
	  
  ;вправо
	(progn													
		(setq angl-blck 0);setq
	);progn
); end cond
(setvar "osmode" 0)
(command "_insert" "выкл-конечн-перекл-спэ" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(setvar "osmode" 6199)
(setvar "orthomode" 1)
(setvar "cmdecho" 1)
(command "_.undo" "_end")
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////

