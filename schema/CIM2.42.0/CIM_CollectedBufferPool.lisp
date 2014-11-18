
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectedBufferPool.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTEDBUFFERPOOL (CIM_MEMBEROFCOLLECTION)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection")
                 (:DESCRIPTION "The 'higher level' or parent Pool.") :KEY)
                :INITFORM "CIM_BufferPool")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member")
                        (:DESCRIPTION "The 'collected' Pool.") :KEY)
                       :INITFORM "CIM_BufferPool"))
              (:CIM-NAME "CIM_CollectedBufferPool")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::Buffers")
               (:DESCRIPTION
                "CIM_CollectedBufferPool is an aggregation association representing that a Pool may itself be contained in a 'higher level' Pool.")))