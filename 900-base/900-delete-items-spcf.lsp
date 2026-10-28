;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// удаление элементов спецификации                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 900-delete-items-spcf

(nmbr-ln pnt-ins / right-bottom st-1 xpnt-ins ypnt-ins)

(setq xpnt-ins (nth 0 pnt-ins)
	 		ypnt-ins (nth 1 pnt-ins)
);setq

(setvar "osmode" 0)

(setq right-bottom (+ (* nmbr-ln 8) 2));setq

;(command "_rectangle" (list (+ xpnt-ins 10) (- ypnt-ins 2)) (list (+ xpnt-ins 2) (- ypnt-ins right-bottom)))

(setq st-1 (ssget "_c" (list (+ xpnt-ins 10) (- ypnt-ins 2)) (list (+ xpnt-ins 2) (- ypnt-ins right-bottom))));setq

(if (/= st-1 nil) (command "_erase" st-1 ""));if

(setq st-1 nil);setq

(setq right-bottom (- right-bottom 8));setq

;(command "_rectangle" (list (+ xpnt-ins 158) (- ypnt-ins 2)) (list (+ xpnt-ins 162) (- ypnt-ins right-bottom)))

(setq st-1 (ssget "_c" (list (+ xpnt-ins 158) (- ypnt-ins 2)) (list (+ xpnt-ins 162) (- ypnt-ins right-bottom))));setq

(if (/= st-1 nil)	(command "_erase" st-1 ""));if

(setq st-1 nil
);setq

;(command "_rectangle" (list (+ xpnt-ins 245.5) (- ypnt-ins 2)) (list (+ xpnt-ins 249.5) (- ypnt-ins right-bottom)))

(setq st-1 (ssget "_c" (list (+ xpnt-ins 245.5) (- ypnt-ins 2)) (list (+ xpnt-ins 249.5) (- ypnt-ins right-bottom))));setq

(if (/= st-1 nil) (command "_erase" st-1 ""));if

(setq st-1 nil);setq

;(command "_rectangle" (list (+ xpnt-ins 278) (- ypnt-ins 2)) (list (+ xpnt-ins 282) (- ypnt-ins right-bottom)))

(setq st-1 (ssget "_c" (list (+ xpnt-ins 278) (- ypnt-ins 2)) (list (+ xpnt-ins 282) (- ypnt-ins right-bottom))));setq

(if (/= st-1 nil) (command "_erase" st-1 ""));if

(setq st-1 nil);setq

;(command "_rectangle" (list (+ xpnt-ins 320.5) (- ypnt-ins 2)) (list (+ xpnt-ins 324.5) (- ypnt-ins right-bottom)))

(setq st-1 (ssget "_c" (list (+ xpnt-ins 320.5) (- ypnt-ins 2)) (list (+ xpnt-ins 324.5) (- ypnt-ins right-bottom))));setq

(if (/= st-1 nil) (command "_erase" st-1 ""));if

(setq st-1 (ssget "_c" (list (+ xpnt-ins 302) (- ypnt-ins 2)) (list (+ xpnt-ins 298) (- ypnt-ins 6)));количество
);setq

(if (= st-1 nil)
	(command "_text" "_MC" (list (+ xpnt-ins 300) (- ypnt-ins 4)) 2.5 0 "**1**")
);if

;(command "_rectangle" (list (+ xpnt-ins 320.5) (- ypnt-ins 2)) (list (+ xpnt-ins 324.5) (- ypnt-ins right-bottom)))

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(princ)
)
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////
