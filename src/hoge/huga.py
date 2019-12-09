"""sample"""
from pyspark.sql import SparkSession
from pyspark.sql import functions as F

spark = SparkSession.builder.getOrCreate()


def piyo():
    """return piyo"""
    return 'piyo'


def piyopiyo():
    """
    return pyspark dataframe

    Returns:
        pyspark.sql.dataframe.DataFrame -- dataframe
    """
    df = spark.createDataFrame([['a', 'aa', 1], ['b', 'bb', 2], ['c', 'cc', 3]], [
                               'USER_ID', 'TARGET_DATE', 'num'])
    df = df.agg(F.sum('num'))
    return df


if __name__ == '__main__':
    print(piyo())
    piyopiyo().show()
