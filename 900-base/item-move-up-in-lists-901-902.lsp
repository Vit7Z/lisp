;/////// ************************************************************ ////////////////////////////////////////
;/////// удаление элемента из списков list-901 и list-902             ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
(defun item-move-up-in-lists-901-902

(str-901 list-901 list-902 / cntr ln-list-901 ln-list-902 lst-lft-1 lst-lft-2 str-list-901)

(setq str-list-901 (atoi (get_tile "txt-901"))
			cntr str-list-901
			ln-list-901 (length list-901)
);setq

(while (>= cntr 0)
	(setq lst-lft-1 (cons (car list-901) lst-lft-1) ;для окна "выбрано"
        list-901 (cdr list-901)
        
        lst-lft-2 (cons (car list-902) lst-lft-2)
        list-902 (cdr list-902)
        
        cntr (1- cntr)
  );setq
);while 

(setq list-901 (append (reverse (cdr lst-lft-1)) list-901)
			ln-list-901 (length list-901)
			list-902 (append (reverse (cdr lst-lft-2)) list-902)
			ln-list-902 (length list-902)
);setq

(cond
	((>= str-list-901 ln-list-901)
		(setq str-list-901 (1- ln-list-901));setq
	);=
);cond

(list-filling "txt-901" list-901)

(set_tile "txt-901" (rtos str-list-901))

(princ)
)
;/////// ************************************************************ ////////////////////////////////////////
;///////                                                              ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////

