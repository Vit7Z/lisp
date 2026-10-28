
;///////////////// рисование переключатель 3 направлени€, 2 полюса //////////////////////////
(defun c:04-switch-2-direction

( / adoc circle-1 hatch-1 pnt-ins x-ins y-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "ltype" "acad_iso02w100" t) nil)
  (command "_.linetype" "_l" "acad_iso02w100" "acadiso.lin" "")
);if

(if	(= (tblsearch "block" "точка-1мм") nil)
  (progn
    (command "_circle" '(0 0) 0.5)
    (setq circle-1 (entlast))
    (command "_hatch" "solid" circle-1 "")
    (setq hatch-1 (entlast))
    (command "_block" "точка-1мм" '(0 0) circle-1 hatch-1 "")
  );progn
);if

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\n”кажите точку вставки\n")
      x-ins (nth 0 pnt-ins)
      y-ins (nth 1 pnt-ins)
);setq

(setvar "osmode" 0)

;горизонтальные линии
(command "_line" pnt-ins (list (+ x-ins 5) y-ins) "")
(command "_line" (list x-ins (- y-ins 22)) (list (+ x-ins 5) (- y-ins 22)) "")

(command "_line" (list (+ x-ins 10) (- y-ins 5)) (list (+ x-ins 15) (- y-ins 5)) "")
(command "_line" (list (+ x-ins 10) (- y-ins 27)) (list (+ x-ins 15) (- y-ins 27)) "")


;вертикальные линии, прерывистые
(setvar "celtscale" 0.4)
(setvar "celtype" "acad_iso02w100")

(command "_line" (list (+ x-ins 5) (+ y-ins 3)) (list (+ x-ins 5) (- y-ins 30)) "")
(command "_line" (list (+ x-ins 10) (+ y-ins 3)) (list (+ x-ins 10) (- y-ins 30)) "")

;вертикальные линии, толстые
(setvar "celtscale" 1)
(setvar "celtype" "ByLayer")
(setvar "CELWEIGHT" 60)

(command "_line" (list (+ x-ins 5) y-ins) (list (+ x-ins 5) (- y-ins 5)) "")
(command "_line" (list (+ x-ins 10) (- y-ins 22)) (list (+ x-ins 10) (- y-ins 27)) "")
				
(setvar "CELWEIGHT" -1)

(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list (+ x-ins 5) y-ins))
(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list (+ x-ins 5) (- y-ins 5)))
(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list (+ x-ins 5) (- y-ins 22)))


(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list (+ x-ins 10) (- y-ins 5)))
(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list (+ x-ins 10) (- y-ins 22)))
(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list (+ x-ins 10) (- y-ins 27)))

(command "_TEXT" "_BL" (list (+ x-ins 1) y-ins) 2.5 0 "**")
(command "_TEXT" "_BL" (list (+ x-ins 1) (- y-ins 22)) 2.5 0 "**")

(command "_TEXT" "_BL" (list (+ x-ins 11) (- y-ins 5)) 2.5 0 "**")
(command "_TEXT" "_BL" (list (+ x-ins 11) (- y-ins 27)) 2.5 0 "**")

(command "_TEXT" "_BC" (list (+ x-ins 5) (+ y-ins 3)) 2.5 0 "1")
(command "_TEXT" "_BC" (list (+ x-ins 10) (+ y-ins 3)) 2.5 0 "2")

(vla-endundomark adoc)

(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(setvar "orthomode" 1)

(gc)
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////

