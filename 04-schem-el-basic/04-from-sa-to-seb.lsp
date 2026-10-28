;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// перенос позиционных обозначений с листа ФСА в CПЭ             ///////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:04-from-sa-to-seb

( / adoc obj-del obj-tmp p11-c p12-c p21-c p22-c pnt-ins set-primitive txt-bottom txt-pos txt-upper x-pnt y-pnt)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar	"OSMODE" 0)

(setq set-primitive 1);setq

(while (/= nil (setq obj-tmp (entget (car (entsel "Выберите прибор\n")))))

	(setq x-pnt (nth 1 (assoc 10 obj-tmp));точка вставки круга
				y-pnt (nth 2 (assoc 10 obj-tmp))
				
				p11-c (list (+ x-pnt 4) (+ y-pnt 1));cекущая рамка, верхний текст
  			p12-c (list (- x-pnt 4) (+ y-pnt 2))
      	p21-c (list (+ x-pnt 4) (- y-pnt 2));cекущая рамка, нижний текст
  			p22-c (list (- x-pnt 4) (- y-pnt 1))
  			
  			txt-upper (ssget "_C" p11-c p12-c '((0 . "TEXT")));верхний текст
  			txt-upper (cdr (assoc 1 (entget (ssname txt-upper 0))))
  			
        txt-bottom (ssget "_C" p21-c p22-c '((0 . "TEXT")));нижний текст
        txt-bottom (cdr (assoc 1 (entget (ssname txt-bottom 0))))
        
	      txt-pos (strcat txt-upper txt-bottom)
	);setq
	
	(setvar	"OSMODE" 6199)

	(setq	pnt-ins			(getpoint "\nУкажите точку 1\n")
				x-pnt	(nth 0 pnt-ins)
				y-pnt	(nth 1 pnt-ins)
	);setq
	
	(setvar	"OSMODE" 0)

	(setq	p11-c (list (+ x-pnt 4) (+ y-pnt 1));cекущая рамка, текст в месте вставки
  			p12-c (list (- x-pnt 4) (+ y-pnt 2))
  			
  			obj-del (ssget "_c" p11-c p12-c '((0 . "*TEXT")))
	);setq
	
	(if (/= obj-del nil) (command "_erase" obj-del ""));if
	
	(command "_TEXT" "_BC" pnt-ins 2.5 0 txt-pos)
);while

(vla-endundomark adoc)

(setvar "CMDECHO" 1)

(setvar	"ORTHOMODE" 1)
(princ)
)
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////// конец программы                                                  //////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

