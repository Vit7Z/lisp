;///////////////// рисование лампа накаливания //////////////////////////
(defun c:04-lamp-heating

( / angl angl-blck circle-1 line-1 line-2 line-3 line-4 pnt-drct pnt-ins xpnt-ins ypnt-ins)
(command "_.undo" "_begin")

(setvar "cmdecho" 0)

(if	(= (tblsearch "block" "лампа-накаливания-спэ") nil) ; ищем блок с именем авт-выкл-1пол
  (progn ; выполнение первого условия, блока нет, создаем и вставляем
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    (command "_line" '(0 0) '(3 0) "")
    (setq line-1 (entlast))
    (command "_line" '(9 0) '(12 0) "")
    (setq line-2 (entlast))
    (command "_line" '(3 0) '(9 0) "");наклонные линии
    (setq line-3 (entlast))
    (command "_line" '(3 0) '(9 0) "")
    (setq line-4 (entlast))
    (command "_rotate" line-3 "" '(6 0) 45 "");поворачиваем линии
    (command "_rotate" line-4 "" '(6 0) -45 "")
    (command "_circle" '(6 0) 3 "")
    (setq circle-1 (entlast))
        
    (command "_block" "лампа-накаливания-спэ" '(0 0) line-1 line-2 line-3 line-4 circle-1 ""
		);command
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
  ((and  
    (<= angl 135)
		(>= angl 45)
	 );and
    (setq angl-blck 90
    ); end setq
  ); end условия
  
  ; влево															 
  ((and
    (<= angl 225)
		(>= angl 135)
   );and
    (setq angl-blck 0
          pnt-ins (list (- xpnt-ins 12) ypnt-ins)
    ); end setq
	); end условия
	
  ; вниз															 
  ((and
    (<= angl 315)
    (>= angl 225)
   );and
    (setq angl-blck 90
          pnt-ins (list xpnt-ins (- ypnt-ins 12))
    ); end setq
	); end условия  	
	  
  ; вправо	
	(progn													
			(setq angl-blck 0 
			); end setq
	);progn
); end cond

(setvar "osmode" 0)
(command "_insert" "лампа-накаливания-спэ" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(setvar "osmode" 6199)
(setvar "orthomode" 1)
(setvar "cmdecho" 1)
(command "_.undo" "_end")
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////
