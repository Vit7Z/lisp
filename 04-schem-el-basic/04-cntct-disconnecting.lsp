
;///////////////// рисование контакт размыкающий //////////////////////////
(defun c:04-cntct-disconnecting

( / angl angl-blck line-1 line-2 line-3 line-5 pnt-1 pnt-drct pnt-ins xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)

(command "_.undo" "_begin")

(if	(= (tblsearch "block" "контакт-НЗ-спэ") nil)
  (progn
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    (setq pnt-1 (polar '(2.625 0) (angtof "330" 0) 4.3301));setq
    (command "_line" '(0 0) '(2.625 0) "")
    (setq line-1 (entlast))
    (command "_line" '(2.625 0) pnt-1 "")
    (setq line-2 (entlast))
    (command "_line" '(6.38 0) '(9 0) "")
    (setq line-3 (entlast))
    (command "_line" '(6.38 0) '(6.38 -2.3) "")
    (setq line-5 (entlast))
    (command "_block" "контакт-НЗ-спэ" '(0 0) line-1 line-2 line-3 line-5 "");command
  );progn
);if

(setvar "osmode" 6199)
(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
      xpnt-ins (nth 0 pnt-ins)
      ypnt-ins (nth 1 pnt-ins)
			pnt-drct (getpoint "\nУкажите направление\n")
			angl (atoi (angtos (angle pnt-ins pnt-drct))) ; угол вставки
);setq

; опеределяем угол поворота
(cond
  ; вверх
  ((and (<= angl 135) (>= angl 45));and
    (setq angl-blck 90);setq
  );=
  
  ; влево
  ((and (<= angl 225) (>= angl 135));and
    (setq angl-blck 0
          pnt-ins (list (- xpnt-ins 9) ypnt-ins)
    );setq
	);=
	
  ; вниз
  ((and (<= angl 315) (>= angl 225));and
    (setq angl-blck 90
          pnt-ins (list xpnt-ins (- ypnt-ins 9))
    ); end setq
	); end условия  	
	  
  ; вправо	
	(progn													
			(setq angl-blck 0); end setq
	);progn
); end cond

(setvar "osmode" 0)
(command "_insert" "контакт-НЗ-спэ" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(setvar "osmode" 6199)
(setvar "orthomode" 1)
(setvar "cmdecho" 1)
(command "_.undo" "_end")
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////

