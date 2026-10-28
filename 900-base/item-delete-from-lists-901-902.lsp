;/////// ************************************************************ ////////////////////////////////////////
;/////// удаление элемента из списков list-901 и list-902             ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
(defun item-delete-from-lists-901-902

(str-901 list-901 list-902 / i len-lists str-901-tmp)

(setq len-lists (length list-901)
      i 0
      list-901-new nil
      list-902-new nil
);setq

(if (and (= str-901 "") (= len-lists 0))
  (alert "Списки пустые.")
);if

(if (or (and (= str-901 "") (= len-lists 1))
        (and (/= str-901 "") (= len-lists 1)))
  (setq list-901-new nil
        list-902-new nil
  );setq
);if

(if (and (= str-901 "") (> len-lists 1))
  (progn
    (alert "Ничего не выбрано.")
    (setq list-901-new list-901
          list-902-new list-902
    );setq
  );progn
);if

(if (and (/= str-901 "") (> len-lists 1))
  (progn
    (repeat len-lists
		  (if (/= (atoi str-901) i)
				(setq str-901-tmp (nth i list-901)
							str-902-tmp (nth i list-902)
							list-901-new (vl-list* str-901-tmp list-901-new)
							list-902-new (vl-list* str-902-tmp list-902-new)
				);setq
			);if
      (setq i (+ i 1));setq
    );repeat
  
    (setq list-901-new (reverse list-901-new)
          list-902-new (reverse list-902-new)
    );setq
  );progn
);if

(list-filling "txt-901" list-901-new)

(princ)
)
;/////// ************************************************************ ////////////////////////////////////////
;///////                                                              ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////

