from pyspark.sql import SparkSession
from pyspark.sql import functions as F

import hoge.huga as target

# spark = SparkSession.builder.getOrCreate()


def test_piyo():
    assert target.piyo() == 'piyo'
