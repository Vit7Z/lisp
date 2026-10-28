
;///////////////////////// рисование точки диаметром 1мм, в блоке //////////////////////
(defun c:04-pnt-diam-1mm-right

( / circle-1 hatch-1 pnt-ins x-pnt-ins y-pnt-ins)

(setvar	"cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "block" "точка-1мм") nil)
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
	(setq x-pnt-ins (+ (nth 0 pnt-ins) 2)
	
			y-pnt-ins (nth 1 pnt-ins)
			
			pnt-ins (list x-pnt-ins y-pnt-ins)
	);setq
	
	(setvar "osmode" 0)
	
  (command "_insert" "точка-1мм" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
  
  (setvar "osmode" 6199)
);while	

(setvar "osmode" 6199)
(setvar	"cmdecho" 1)	
(princ)
)
;///////////////////////// конец программы /////////////////////////////////////////////