
;///////////////////////// рисование точки диаметром 1мм, в блоке //////////////////////
(defun c:04-pnt-diam-1mm

( / circle-1 hatch-1 pnt-ins)

(setvar	"cmdecho" 0)
(setvar "osmode" 0)

(if	(= (tblsearch "block" "точка-1мм") nil)
  (progn
    (command "_circle" '(0 0) 0.5)
    (setq circle-1 (entlast))
    (command "_hatch" "solid" circle-1 "")
    (setq hatch-1 (entlast))
    (command "_block" "точка-1мм" '(0 0) circle-1 hatch-1 "")
  );progn
);if

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\n”кажите точку вставки\n")) nil)
  (command "_insert" "точка-1мм" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
);while	
	
(setvar	"cmdecho" 1)	
(princ)
)
;///////////////////////// конец программы /////////////////////////////////////////////

;///////////////////////// рисование точки диаметром 2мм, в блоке //////////////////////
(defun c:04-pnt-diam-2mm

( / circle-1 hatch-1 pnt-ins)

(setvar	"cmdecho" 0)
(if	(= (tblsearch "block" "точка-2мм") nil)
  (progn ; выполнение первого услови€, блока нет, создаем и вставл€ем
    (setvar "osmode" 0)
    (command "_circle" '(0 0) 1)
    (setq circle-1 (entlast))
    (command "_hatch" "solid" circle-1 "")
    (setq hatch-1 (entlast))
    (command "_block" "точка-2мм" '(0 0) circle-1 hatch-1 "")
  ) ; конец progn
);if

(setvar "osmode" 6199)
	
(while (/= (setq pnt-ins (getpoint "\n”кажите точку вставки\n")) nil)
  (command "_insert" "точка-2мм" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
);while	
	
(setvar	"cmdecho" 1)	
(princ)
)
;///////////////////////// конец программы /////////////////////////////////////////////
