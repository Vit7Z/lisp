;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование экрана кабеля, для ссвп щита                       //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:07-shld-cble-case-2-join

( / adoc counter pnt-frst pnt-ins tmp-celtscale x-pnt-ins y-pnt-ins)

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "cmdecho" 0)

(setq counter 0
			tmp-celtscale (getvar "celtscale")  ;получаем текущее значение масштаба
);setq

(if (= (tblsearch "ltype" "acad_iso02w100" t) nil)
  (command "_.linetype" "_l" "acad_iso02w100" "acadiso.lin" "")
);if

(while (/= (setq pnt-ins (getpoint "\nУкажите точку\n")) nil)
  (progn
    (setq x-pnt-ins (nth 0 pnt-ins));setq)
    
    (if (= counter 0)
      (setq y-pnt-ins (nth 1 pnt-ins)
      			pnt-frst (list (+ x-pnt-ins 3) (- y-pnt-ins 3))
      );setq
    );if
    
    (setvar "osmode" 0)
    
    (command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list (+ x-pnt-ins 1) (- y-pnt-ins 6)))
    
    ;;;;;;;вертикальная линия
    (command "_line" (list x-pnt-ins y-pnt-ins) (list x-pnt-ins (- y-pnt-ins 8)) "")
    
    (setvar "celtype" "acad_iso02w100")
    
    (setvar "celtscale" 0.1)
    
    (command "_circle" (list x-pnt-ins (- y-pnt-ins 6)) 1)
    
    ;;;;;;;штриховая линия
    (command "_line" (list (+ x-pnt-ins 1) (- y-pnt-ins 6));начало
                     (list (+ x-pnt-ins 3) (- y-pnt-ins 6));середина
                     (list (+ x-pnt-ins 3) (- y-pnt-ins 3))
    "");command
    
    (setvar "celtscale" tmp-celtscale);возвращаем настройки
    
    (setvar "celtype" "Bylayer")
    
    (if (> counter 0)
      (command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list (+ x-pnt-ins 3) (- y-pnt-ins 3)))
    );if
  
    (setq counter (+ counter 1));setq
  );progn

 (setvar "osmode" 6199)
);while

(setvar "celtype" "acad_iso02w100");новый тип линии
(setvar "celtscale" 0.1);новое значение масштаба
(command "_line" pnt-frst (list (+ x-pnt-ins 3) (- y-pnt-ins 3)) "") ;горизонтальная линия

(setvar "celtscale" tmp-celtscale);возвращаем настройки
(setvar "celtype" "Bylayer")
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
(gc)
)
;///////////////////////////////////////////////////////// конец программы /////////////////////////////////////////////////////////////////
