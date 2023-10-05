# Visitor pattern

## 1. DocumentBase

It's a simple project that has 'Document' that consists of 'Image', 'Paragraph', 'Title'. It's a project that in the next iteration will have Visitor pattern implemented.

![370248519_1065545308212796_1598387597113961674_n](https://github.com/heyimjustalex/DesignPatterns/assets/21158649/40379354-d120-40b0-95ee-9a676406712d)


## 2. DocumentVisitorWihoutModification

It's a modificaiton of project 1. DocumentBase that implements Visitor pattern, but without implementing 'Accept(IVistor)' (so that it does not make any modification in any 'DocumentElement'). Instead it uses type casting to invoke Visitor on an object, of particular DocumentElement class. The Visitor is used to export 'DocumentElements' to PDF.

![385551355_358817173322773_3410959859631446479_n](https://github.com/heyimjustalex/DesignPatterns/assets/21158649/1b63ba3d-60ee-48c4-8a1e-a71ee5044312)


**Pros:**
  - We did not touch anything in 'IDocumentElement', 'Image', 'Paragraph' or 'Title'

**Cons:**
  - Each time we add new DocumentElement we need to edit 'Document.ExportAllDocumentElementsToPDF()' method and check another type
  - Using general type (Interface 'IVisitDocumentElement') didn't help cause we had to cast it in 'Document.ExportAllDocumentElementsToPDF()' method anyway
  - We break OCP, because every time we need to add new 'DocumentElement' we need to modify 'Document.ExportAllDocumentElementsToPDF()' method

## 3. DocumentVisitorWithModification

It's a modification of project 2. DocumentVisitorWihoutModification that modifies the Visitor so that 'DocumentElements' are modified with 'Accept' method. This is a proper implementation that has interface 'IAcceptVisitor' that is implemented with 'IDocumentElement' interface.

![371470715_811674984043626_1713823486591569104_n](https://github.com/heyimjustalex/DesignPatterns/assets/21158649/daa61eae-fa42-44ae-9ecf-661b7524d208)


**Pros:**
  - Each time we add new DocumentElement we need DO NOT NEED to edit 'Document.ExportAllDocumentElementsToPDF()' method and check another type
  - We do not break OCP

**Cons:**
  - We did touch 'IDocumentElement', 'Image', 'Paragraph' and 'Title' classes

## 4. ShoppingCartBase
Shopping cart example that uses abstract class for 'Product'. Vistor pattern will be implemented to count discounts for each product in shopping cart

## 5. ShoppingCartVisitorExample
It shows the implementation when classes that are supposed to implement 'Accept' have 'ProductBase' class that is used.

**Cons:**
- Using 'ProductBase' abstract class in ShoppingCart makes you implement 'Accept' visitor for abstract class
- YOu still have to implement 'Accept' for every subclass like 'Drink', 'Fruit', 'Meat' so that 'this' used in 'Accept' does not point to 'ProductBase'
- Using Visitor in ProductBase forces me to implement Visitor for ProductBase, which I might not want

**Using interfaces instead of abstract classes seems to give more flexibility. **

