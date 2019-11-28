from pyspark.sql import SparkSession
from pyspark.sql import functions as F

spark = SparkSession.builder.getOrCreate()


def piyo():
    print('piyo')


def piyopiyo():
    df = spark.createDataFrame([['a', 'aa', 1], ['b', 'bb', 2], ['c', 'cc', 3]], [
                               'USER_ID', 'TARGET_DATE', 'num'])
    df = df.agg(F.sum('num'))
    df.show()


if __name__ == '__main__':
    piyo()
    piyopiyo()
