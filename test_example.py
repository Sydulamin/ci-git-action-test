""" test_example.py"""
import os


def test_example():
    """ adding function"""
    assert 1 + 1 == 2


BASE_DIR = os.path.dirname(
    os.path.abspath(__file__)
)
