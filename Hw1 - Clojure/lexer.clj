;; by Derya KAPTAN - 141044025


(use '[clojure.string :only (join split)])
(require '[clojure.string :as string])

(def Keywords '("and", "or", "not", "equal", "append", "concat", "set", "deffun", "for", "while", "if", "then", "else", "true", "false"))
(def Operators '("+", "-", "/", "*", "(", ")"))


(defn main []
    (def string (slurp "CoffeeSample.coffee")) ;; read file and add to string
    (println string)
    (.replace string "(" "( ")                 ;; add a white space between paranthesis (bosluklara gore parse edebilmek icin)
    (.replace string ")" " )")
    (println "Parsing string..")
    (println (join "\n" (split string #"\s+")))   ;; parse a string
   	
    (if (.contains string "(")
    	(do (println "This is first paranthesis -> (")))
	(if (.contains string "+")
    	(do (println "There is a addition Operator in expression -> +")))
	(if (.contains string "-")
    	(do (println "There is a subtraction Operator in expression -> -")))
	(if (.contains string "/")
    	(do (println "There is a division Operator in expression -> /")))
	(if (.contains string "*")
    	(do (println "There is a multiplication Operator in expression -> *")))
	(if (.contains string "(")
    	(do (println "This is a last paranthesis -> )")))
	
   )
(main)
