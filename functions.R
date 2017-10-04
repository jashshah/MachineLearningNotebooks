num_NAS <- function(DataFrame){
  return(sapply(DataFrame, function(x) sum(is.na(x))))
}

return_max <- function(x){
  
  val <- names(sort(table(x), decreasing = TRUE))[1]
  
  return(val)
  
}

plot_histogram <- function(X, var){
  
  print(ggplot(X, aes_string(var, '..density..')) + 
    geom_histogram() + ylab('') + 
    geom_line(aes(y = ..density..), stat = 'density'))
}


plot_boxplot <- function(X, X_var, Y_var){
  print(ggplot(train, aes_string(X_var, Y_var)) + geom_boxplot())
}

plot_faceted_histogram <- function(X, var, facet_by){
  
  print(ggplot(X, aes_string(var, '..density..')) + geom_histogram() + facet_wrap(facet_by))
  
}

plot_bar_plot_count <- function(X, var){
  print(ggplot(X, aes_string(var)) + 
          geom_bar() + 
          theme(axis.text.x = element_text(angle = 90, hjust = 1)))
}

plot_bar_plot_prop <- function(X, var1, var2){
  
  df <- X %>%
    group_by_(var1) %>%
    summarise(mean = mean(!!sym(var2)))
  
  print(ggplot(df, aes_string(var1, 'mean')) + geom_bar(stat = 'identity') + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) + ylab('Proportion')) 
  
}


plot_bar_plot_stacked <- function(X, var1, var2){
  
  print(ggplot(X, aes_string(var1, fill = var2)) + geom_bar(position = "stack") + theme(axis.text.x = element_text(angle = 90, hjust = 1)))
  
}

train_test_split <- function(DataFrame, DepVar, Split, seed){
  library(caTools)
  set.seed(seed)
  ind <- sample.split(Y = DataFrame[,DepVar], SplitRatio = Split)
  train <- DataFrame[ind,]
  test <- DataFrame[!ind,]
  return(list(train = train, test = test))
  print("The training and testing datasets have been created.")
}

