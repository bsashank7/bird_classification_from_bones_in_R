df<-read.csv(file.choose())
is.na(df)
drop.na(df)
df<-na.omit(df)
df<-df[,-1]
df$type<-as.factor(df$type)
library(rpart)
library(randomForest)
library(party)
library(magrittr)
library(dplyr)
library(caret)
library(e1071)

sindex<-sample(2,nrow(df),replace=T,prob = c(0.7,0.3))
train_data<- df[sindex==1,]
test_data<-df[sindex==2,]


######### decision tree
dtmodel<- rpart(type~.,data=train_data,
                method= 'class',
                parms=list(split='information'))

pred_train<- predict(dtmodel,newdata= train_data,type = 'class')
pred_test<- predict(dtmodel,newdata= test_data,type = 'class')
conf_train<-table(observed=train_data$type,predicted=pred_train)
conf_test<-table(observed=test_data$type,predicted=pred_test)
accu_train<-sum(diag(conf_train))/sum(conf_train)
accu_test<-sum(diag(conf_test))/sum(conf_test)
accu_train;accu_test


######## random forest
rf <- randomForest(type~., data= train_data,
                   importance=T,ntree = 100)
pred_train<- predict(rf,newdata= train_data,type = 'class')
pred_test<- predict(rf,newdata= test_data,type = 'class')
conf_train<-table(observed=train_data$type,predicted=pred_train)
conf_test<-table(observed=test_data$type,predicted=pred_test)
accu_train<-sum(diag(conf_train))/sum(conf_train)
accu_test<-sum(diag(conf_test))/sum(conf_test)
accu_train;accu_test


########## conditional tree
rf_cond<- cforest(type~.,data=train_data)

pred_train<- predict(rf_cond,newdata= train_data,type = 'class')
pred_test<- predict(rf_cond,newdata= test_data,type = 'class')
conf_train<-table(observed=train_data$type,predicted=pred_train)
conf_test<-table(observed=test_data$type,predicted=pred_test)
accu_train<-sum(diag(conf_train))/sum(conf_train)
accu_test<-sum(diag(conf_test))/sum(conf_test)
accu_train;accu_test



######## knn 
knn_fit<-train(type~., data=train_data ,
               method='knn',
               tuneLength=20,
               
               preProc= c('center','scale'),
               tuneGrid = expand.grid(k=c(1:30)))

pred_train<- predict(knn_fit,newdata= train_data)
pred_test<- predict(knn_fit,newdata= test_data)
conf_train<-table(observed=train_data$type,predicted=pred_train)
conf_test<-table(observed=test_data$type,predicted=pred_test)
accu_train<-sum(diag(conf_train))/sum(conf_train)
accu_test<-sum(diag(conf_test))/sum(conf_test)
accu_train;accu_test



########## svm
trcon<-trainControl(method='repeatedcv',
                    number=5,
                    repeats=5)
svm_cv<- train(type~., data=train_data,
               method='svmRadial',
               tuneGrid=expand.grid(C=seq(0,5,length=20),sigma=10^(-7:1)),
               preProc=c('center','scale'),
               trControl=trcon)

pred_train<- predict(svm_cv,newdata= train_data)
pred_test<- predict(svm_cv,newdata= test_data)
conf_train<-table(observed=train_data$type,predicted=pred_train)
conf_test<-table(observed=test_data$type,predicted=pred_test)
accu_train<-sum(diag(conf_train))/sum(conf_train)
accu_test<-sum(diag(conf_test))/sum(conf_test)
accu_train;accu_test